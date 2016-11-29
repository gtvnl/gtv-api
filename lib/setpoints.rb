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
    else
      if setpoint.sensor.nil?
        puts "Configure the target sensor first."
      elsif setpoint.gpio.nil?
        puts "Configure the target GPIO first."
      else
        # Assume we have valid data
        current_temp = Sensors.check_one(setpoint.sensor)
        min_temp = setpoint.value

        if current_temp < min_temp
          puts "Temperatuur is te laag."
        elsif current_temp > min_temp
          puts "Temperatuur is te hoog."
        end


      end
    end
  end

  end
end
