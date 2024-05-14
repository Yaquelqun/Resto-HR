class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :restos, through: :participations
  has_many :feedbacks, through: :participations

  has_many :received_feedbacks, class_name: "Feedback", inverse_of: :target
end
