class CreateMeetings
  attr_reader :resto

  def initialize(resto:)
    @resto = resto
  end

  def call
    remaining_intents = accept_direct_matchings(resto.meeting_intents)
    #the remaining intents are the one that were only asked by one of the two.
    fill_intent_schedule(remaining_intents)
  end

  private

  # First we want to accept all intents that were asked from both sides
  def accept_direct_matchings(intents)
    # this gives us all pairings where both users want to talk to eachother
    intents.pluck(:initiator_id, :target_id).map(&:sort).tally.select { _2 >= 2 }.each do |targets, _count|
      matches = intents.select { targets.includes(_1.participation_id) && target.includes(_1.target_id) }
      intents -= matches
      matches.update_all(state: intent::PLANNED)
    end
  end

  # This is going to take all remaining intent and accept them if there is still a slot
  # Note: This is probably going to be slow af because of all the db-requests.
  def fill_intent_schedule(intents)
    intents.each do |intent|
      next if intent.user.intents.count(participation_id: intent.participation_id, state: intent::PLANNED) >= Resto::MATCHINGS_LIMIT
      next if intent.target.intents.count(participation_id: intent.participation_id, state: intent::PLANNED) >= Resto::MATCHINGS_LIMIT
      intent.update(state: intent::PLANNED)
      dup = intent.dup
      dup.update(target: intent.participation.user, participation: Participation.find_by!(resto_id: resto.id, user: intent.participation.user))
    end
  end
end
