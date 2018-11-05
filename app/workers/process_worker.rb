class ProcessWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
end
