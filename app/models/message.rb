class Message < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user

  after_save :notify!

  validates :message, presence: true,
                      length: { in: 1..160 }

  private

  def notify!
    prepended_message = "#{user.prepend_text} #{message}".strip

    SendSmsJob.perform_later(user, prepended_message)
  end
end
