class Setpoints
  class << self

  def check_all
    @setpoints =  Setpoint.where.not(sensor: nil, gpio: nil)

    @setpoints.each do |setpoint|

    end

  end

  def check(setpoint)
    if !setpoint.is_a? Setpoint
      puts "Invalid input. Use a setpoint"
    end
  end

  end
end
