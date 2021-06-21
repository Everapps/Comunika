require 'rails_helper'

RSpec.describe TwilioSmsJob, type: :job, vcr: true do
  subject(:job) { described_class.perform_later(record.id) }

  let(:user) { create(:user, phone: '9168992758') }
  let(:record) { create(:notification, user: user) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class).with(record.id)
  end

  it 'executes perform' do
    perform_enqueued_jobs { described_class.perform_later(record.id) }
  end
end
