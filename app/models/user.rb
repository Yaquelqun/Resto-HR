class User < ApplicationRecord
  USER = 'user'
  ADMIN = 'admin'
  ROLES = [USER, ADMIN].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :restos, through: :participations
  has_many :initiated_meeting_intents, class_name: 'MeetingIntent', foreign_key: 'initiator_id'
  has_many :targeted_meeting_intents, class_name: 'MeetingIntent', foreign_key: 'target_id'
  has_many :meeting_users
  has_many :meetings, through: :meeting_users

  validates :role, inclusion: { in: ROLES }
end
