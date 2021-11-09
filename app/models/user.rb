# frozen_string_literal: true

class User < ApplicationRecord
  enum role: {
    tenant: 'tenant',
    owner: 'owner',
    manager: 'manager'
  }

  belongs_to :community
  has_many :messages

  scope :managers, -> { where(role: 'manager') }
  scope :owners, -> { where(role: 'owner') }

  def prepend_text
    return 'To Tenant:' if tenant?
    return 'To Owner:' if owner?
  end
end
