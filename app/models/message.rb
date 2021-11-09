class Message < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user

  after_save :notify!

  validates :message, presence: true,
                      length: { in: 1..160 }

  def notify!
    SendSmsJob.perform_later(user, message)
  end
end
