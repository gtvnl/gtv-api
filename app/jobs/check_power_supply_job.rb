class CheckPowerSupplyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Inputs.check_power_supply
  end
end
