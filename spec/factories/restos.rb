FactoryBot.define do
  factory :resto do
    date { Faker::Date.forward(days: 30) }
  
  end
end 