class User < ApplicationRecord
  belongs_to :community
  has_many :notifications

  validates :phone, phone: { allow_blank: true }

  ROLES = %w{ tenant owner manager }

  ROLES.each do |role_type|
    define_method(:"#{role_type}?") do
      role_type == role
    end
  end
end
