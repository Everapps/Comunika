class User < ApplicationRecord
  belongs_to :community
  has_many  :messages

  ROLES = %w{ tenant owner manager }
end
