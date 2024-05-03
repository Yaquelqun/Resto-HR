class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :resto
  has_many :feedbacks
end