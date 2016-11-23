class ReadSensorsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Sensors.read_one("sensor")
  end
end
