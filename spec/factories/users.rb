FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password123' }
    pseudo { Faker::Name.unique.name }
    role { User::USER }

    trait :admin do
      role { User::ADMIN }
    end
  end
end 