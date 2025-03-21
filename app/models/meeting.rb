class Meeting < ApplicationRecord
  has_many :meeting_users
  has_many :users, through: :meeting_users
  belongs_to :resto
end