# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    message { 'Hello there!' }

    association :user
    association :admin_user
  end
end