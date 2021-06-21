RSpec.configure do |config|
  config.include ActiveJob::TestHelper, type: :job

  config.after(:each, type: :job) do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
