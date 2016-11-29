class Setpoints
  class << self

  def check_all
    puts"all"
  end

  def check(address)
    sensor = Sensor.find_by(address: address)
    puts sensor

    setpoint = Setpoint.find_by(address: address)
    puts setpoint
  end

  end
end
