class ScanSensorsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Sensors.scan
  end
end
