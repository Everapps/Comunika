require 'rails_helper'

RSpec.describe SendSmsJob, type: :job do
  include ActiveJob::TestHelper

  let(:user) { create(:user, :with_owner_role) }
  let(:message) { 'Hello There!' }

  subject(:job) { SendSmsJob.perform_later(user, message) }

  it 'should queue the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'should queue the job in the default queue' do
    expect(job.queue_name).to eq('default')
  end

  it 'should call the TextMessenger service' do
    allow(TextMessenger).to receive(:call).with(phone_number: user.phone_number,
                                                message: message)

    perform_enqueued_jobs { job }
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
