FactoryBot.define do
  factory :message do
    association :user

    body { Faker::Lorem.sentence }
  end
end
