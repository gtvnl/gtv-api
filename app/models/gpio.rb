class Gpio < ApplicationRecord

  has_one :setpoint

  def operating_hours
    return operating_hours.to_f / 3600
  end

end
