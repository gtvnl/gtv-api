class UpdateSensorsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Sensors.update
  end
end
