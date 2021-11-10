# frozen_string_literal: true

FactoryBot.define do
  factory :community do
    name { 'Community 1' }
    sequence(:subdomain) { |n| "testcommunity#{n}" }
  end
end