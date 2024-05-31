class CreateMatchings
  attr_reader :resto

  def initialize(resto:)
    @resto = resto
  end

  def call
    remaining_feedbacks = accept_direct_matchings(resto.feedbacks)
    #the remaining feedbacks are the one that were only asked by one of the two.
    fill_feedback_schedule(remaining_feedbacks)
  end

  private

  # First we want to accept all feedbacks that were asked from both sides
  def accept_direct_matchings(feedbacks)
    # this gives us all pairings where both users want to talk to eachother
    feedbacks.pluck(:participation_id, :target_id).map(&:sort).tally.select { _2 >= 2 }.each do |targets, _count|
      matches = feedbacks.select { targets.includes(_1.participation_id) && target.includes(_1.target_id) }
      feedbacks -= matches
      matches.update_all(state: Feedback::PLANNED)
    end
  end

  # This is going to take all remaining feedback and accept them if there is still a slot
  # Note: This is probably going to be slow af because of all the db-requests.
  def fill_feedback_schedule(feedbacks)
    feedbacks.each do |feedback|
      next if feedback.user.feedbacks.count(participation_id: feedback.participation_id, state: Feedback::PLANNED) >= Resto::MATCHINGS_LIMIT
      next if feedback.target.feedbacks.count(participation_id: feedback.participation_id, state: Feedback::PLANNED) >= Resto::MATCHINGS_LIMIT
      feedback.update(state: Feedback::PLANNED)
      dup = feedback.dup
      dup.update(target: feedback.participation.user, participation: Participation.find_by!(resto_id: resto.id, user: feedback.participation.user))
    end
  end
end
