class Gpio < ApplicationRecord

  has_one :setpoint

  def operating_hours
    return operating_seconds.to_f / 3600
  end

  def operating_minutes
    return operating_seconds.to_f / 60
  end
end
