class Setpoints
  class << self

    def check_all
      @setpoints =  Setpoint.where.not(sensor: nil, gpio: nil)

      @setpoints.each do |setpoint|
        check(setpoint)
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
          relais = setpoint.gpio.pin
          current_temp = Sensors.read_one(setpoint.sensor)[setpoint.sensor.address]
          min_temp = setpoint.value
          max_diff = setpoint.value - setpoint.max_temp_difference

          if current_temp < min_temp
            if current_temp <= max_diff
              Log.create(description: "CRITICAL TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
              title = "CRITICAL TEMPERATURE detected: #{current_temp} on #{setpoint.name}."
              body = "Sensor: #{setpoint.sensor.name}\nRelais: #{setpoint.gpio.name}\nCurrent Temperature: #{current_temp}\nSetpoint Temperature: #{min_temp}\nCritical Temperature: #{max_diff}"

              ErrorMailer.error_email(title, body).deliver
            end
              Log.create(description: "Low TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
              Relais.on(relais)
            
          elsif current_temp > min_temp
            Log.create(description: "Temperature RECOVERED: #{current_temp} on #{setpoint.name}.")
            Relais.off(relais)
          end
        end
      end
    end

  end
end
