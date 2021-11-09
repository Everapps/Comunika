# frozen_string_literal: true

class User < ApplicationRecord
  enum roles: {
    tenant: 'tenant',
    owner: 'owner',
    manager: 'manager'
  }

  belongs_to :community
  has_many :messages

  scope :managers, -> { where(role: 'manager') }
  scope :owners, -> { where(role: 'owner') }
end
