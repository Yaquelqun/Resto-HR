class MeetingIntent < ApplicationRecord
  belongs_to :resto
  belongs_to :target, class_name: 'User'
  belongs_to :initiator, class_name: 'User'
end
