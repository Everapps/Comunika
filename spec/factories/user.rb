# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Gerald Padgett' }
    email { 'padgett.gerald93@gmail.com' }
    phone_number { '+50583898321' }
    association :community

    trait :with_tenant_role do
      role { 'tenant' }
    end

    trait :with_owner_role do
      role { 'owner' }
    end

    trait :with_manager_role do
      role { 'manager' }
    end
  end
end