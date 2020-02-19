FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role { "tenant" }
    contact_number { Faker::PhoneNumber.phone_number }
    association :community 
  end
end
