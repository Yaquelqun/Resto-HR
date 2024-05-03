class Resto < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :feedbacks, through: :participations
end