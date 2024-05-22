class Resto < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :feedbacks, through: :participations

  def humanized_description
    humanized_date + " " + "participants: #{users.count}"
  end

  def humanized_date
    date.strftime("%A, %B %d, %Y")
  end
end