class CreateMeetings
  attr_reader :resto_id, :planned_pairs, :users_meetings_count

  def initialize(resto_id:)
    @resto_id = resto_id
    @planned_pairs = []
    @users_meetings_count = Hash.new(0) # Used to count how many meetings a user has
  end

  def call
    return { status: :not_found, error_message: "invalid resto", response: nil } unless resto
    intended_pairs = resto.meeting_intents.pluck(:initiator_id, :target_id).map(&:sort) # bunch of pairs of users that wanna talk
    double_intent_meets = [] # pairs of users that both want to talk to each other
    single_intent_meets = [] # pairs of users where only one of them has the other in their intent list
    intended_pairs.tally.each { |pair, count| (count > 1 ? double_intent_meets : single_intent_meets) << pair }
    meetings_to_try = double_intent_meets + single_intent_meets.shuffle # We want to shuffle the single_intents to give everyone a chance to have their intent accepted

    meetings_to_try.each { |pair| try_adding_to_planned_pairs(*pair) }
    # At that point, we have a list of pairs of users that want to meet each other, and we have to create the meetings
    create_meetings
    resto.update(state: "ongoing")
    { status: :success, success_message: "Meetings created!", response: nil }
  end

  private

  def resto
    @resto ||= Resto.waiting_for_participants.find_by(id: resto_id)
  end

  def try_adding_to_planned_pairs(user_id_1, user_id_2)
    return if users_meetings_count[user_id_1] >= Meeting::MAX_SLOTS_PER_USER
    return if users_meetings_count[user_id_2] >= Meeting::MAX_SLOTS_PER_USER

    planned_pairs << [user_id_1, user_id_2]
    users_meetings_count[user_id_1] += 1
    users_meetings_count[user_id_2] += 1
  end

  # Abysmal performances for now, should be optimized to be 2 queries using upsert_all
  def create_meetings
    planned_pairs.each do |pair|
      meeting = Meeting.create(resto_id: resto_id, place: "Zoom", date: resto.date, duration: 30)
      meeting.users << User.find(pair)
    end
  end
end