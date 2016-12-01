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
              body = "Sensor: #{setpoint.sensor.name}\n
                      Relais: #{setpoint.gpio.name}\n
                      Current Temperature: #{current_temp}\n
                      Setpoint Temperature: #{min_temp}\n
                      Critical Temperature: #{max_diff}"

              ErrorMailer.error_mail(title, body).deliver
            else
              Log.create(description: "Low TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
              Relais.on(relais)
            end
          elsif current_temp > min_temp
            Log.create(description: "Temperature RECOVERRED: #{current_temp} on #{setpoint.name}.")
            Relais.off(relais)
          end
        end
      end
    end

  end
end
