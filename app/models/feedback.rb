class Feedback < ApplicationRecord
  INTENDED = 'intended'.freeze
  PLANNED = 'planned'.freeze
  GIVEN = 'given'.freeze
  STATES = [INTENDED, PLANNED, GIVEN].freeze

  belongs_to :participation
  has_one :user, through: :participation
  has_one :resto, through: :participation

  belongs_to :target, class_name: 'User'

  validates :state, inclusion: { in: STATES }
end
