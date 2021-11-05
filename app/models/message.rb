class Message < ApplicationRecord
  belongs_to  :user

  validates :body, presence: true, length: { minimum: 1, maximum: 160 }

  def notify_user
    ::TwilioSmsNotifyJob.perform_later(message_id: id)
  end

  def prepended_body
    return body.prepend("To Tenant:") if user.tenant?

    return body.prepend("To Owner:") if user.owner?

    body
  end
end