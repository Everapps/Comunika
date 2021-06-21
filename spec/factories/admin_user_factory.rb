FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    sequence(:password) { |n| "password#{n}" }
  end
end
