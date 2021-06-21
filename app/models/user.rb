class User < ApplicationRecord
  belongs_to :community
  has_many :notifications

  validates :phone, phone: { allow_blank: true }

  ROLES = %w{ tenant owner manager }
end
