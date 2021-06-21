FactoryBot.define do
  factory :user do
    association :community

    name { Faker::Name.name }
    email { Faker::Internet.email }
    sequence(:phone) { |n| "+1916899275#{n}" }
    role { "tenant" }

    trait :tenant do
      role { 'tenant' }
    end

    trait :owner do
      role { 'owner' }
    end

    trait :manager do
      role { 'manager' }
    end
  end
end
