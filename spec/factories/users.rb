FactoryBot.define do
  factory :user do
    association :community

    name { Faker::Name.name }
    email { Faker::Internet.email }
    role  { 'tenant' }
    contact_number { Faker::PhoneNumber.phone_number }

    trait :tenant do
      role { 'tenant' }
    end

    trait :manager do
      role { 'manager' }
    end

    trait :owner do
      role { 'owner' }
    end
  end
end
