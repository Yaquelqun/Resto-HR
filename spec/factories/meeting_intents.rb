FactoryBot.define do
  factory :meeting_intent do
    association :resto
    association :initiator, factory: :user
    association :target, factory: :user
  end
end 