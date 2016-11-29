class Setpoints
  class << self

  def check_all
    @setpoints =  Setpoint.where.not(sensor: nil, gpio: nil)

    @setpoints.each do |setpoint|
      check(setpoint)
    end

  end

  def check(setpoint)

    Relais.setup

    if !setpoint.is_a? Setpoint
      puts "Invalid input. Use a setpoint"
    else
      if setpoint.sensor.nil?
        puts "Configure the target sensor first."
      elsif setpoint.gpio.nil?
        puts "Configure the target GPIO first."
      else
        # Assume we have valid data
        relais = setpoint.gpio.pin
        current_temp = Sensors.read_one(setpoint.sensor)[setpoint.sensor.address]
        min_temp = setpoint.value

        if current_temp < min_temp
          puts "Temperatuur is te laag."
          Relais.on(relais)
        elsif current_temp > min_temp
          puts "Temperatuur is te hoog."
          Relais.off(relais)
        end


      end
    end
  end

  end
end
