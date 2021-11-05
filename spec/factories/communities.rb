FactoryBot.define do
  factory :community do
    name { Faker::Name.name }
    sequence(:subdomain) { |n| "subdomain#{n}" }
  end
end
