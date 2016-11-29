class CheckSetpointsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Setpoints.check_all
  end
end
