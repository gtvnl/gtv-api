class StartPollingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Inputs.start_polling
  end
end
