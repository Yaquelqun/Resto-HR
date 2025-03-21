class Meeting < ApplicationRecord
  MAX_SLOTS_PER_USER = 5 # Static for now, should be in the resto object

  has_many :meeting_users, dependent: :destroy
  has_many :users, through: :meeting_users
  belongs_to :resto
end