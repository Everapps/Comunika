FactoryBot.define do
  factory :community do
    name { Faker::Company.name }
    sequence(:subdomain) { |n| "subdomain#{n}" }
  end
end
