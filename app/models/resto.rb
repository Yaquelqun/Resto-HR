class Resto < ApplicationRecord
  MATCHINGS_LIMIT = 6

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :meeting_intents
  has_many :meetings

  validates_presence_of :date
  validates :state, inclusion: { in: %w(waiting_for_participants ongoing) }

  scope :waiting_for_participants, -> { where(state: "waiting_for_participants") }
  before_create :generate_code_name

  def humanized_date
    date.strftime("%A, %B %d, %Y")
  end

  private

  def generate_code_name
    potential_name = "#{Faker::Color.color_name}-#{Faker::Creature::Animal.name}"
    return generate_code_name if Resto.exists?(code_name: potential_name)
    self.code_name = potential_name 
  end
end