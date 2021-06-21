FactoryBot.define do
  factory :notification do
    association :user

    message { Faker::Lorem.sentence }
  end
end
