class Resto < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :feedbacks, through: :participations

  def humanized_description
    date.strftime("%A, %B %d, %Y") + " participants: #{users.count}"
  end
end