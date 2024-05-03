class Feedback < ApplicationRecord
  belongs_to :participation
  has_one :user, through: :participation
  has_one :resto, through: :participation
  
  belongs_to :target, class_name: 'User'
end
