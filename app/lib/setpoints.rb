class Setpoints
  class << self

    def send_email(setpoint, current_temp, desired_temp, min_temp, highlow)

      Log.create(description: "CRITICAL TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
      title = "CRITICALLY #{highlow} TEMPERATURE detected: #{current_temp} on #{setpoint.name}."
      body = "Sensor: #{setpoint.sensor.name}\nCurrent Temperature: #{current_temp}\nSetpoint Temperature: #{desired_temp}\nCritical Temperature: #{min_temp}"

      ErrorMailer.error_email(title, body).deliver

    end

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
          current_temp = Sensors.read_one(setpoint.sensor)["#{setpoint.sensor.address}"]
          desired_temp = setpoint.value
          min_temp = setpoint.value - setpoint.max_temp_difference




          if current_temp < desired_temp

            if current_temp <= min_temp
              // TEMP CRITICAL LOW EMAIL
              send_email(setpoint, current_temp, desired_temp, min_temp, "LOW")
            else
              // Turn on heating ribbons
              Log.create(description: "Low TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
              Relais.on(relais)
            end

          elsif current_temp = desired_temp
            // Turn off heating ribbons
            // TEMP ACQUIRED EMAIL
            Log.create(description: "DESIRED TEMPERATURE ACQUIRED: #{current_temp} on #{setpoint.name}.")
            Relais.off(relais)
          elseif current_temp > desired_temp
            // TEMPCRITICAL HIGH EMAIL
            Relais.off(relais)
            send_email(setpoint, current_temp, desired_temp, min_temp, "HIGH")
          end




            if current_temp <= min_temp

              Log.create(description: "CRITICAL TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
              title = "CRITICAL TEMPERATURE detected: #{current_temp} on #{setpoint.name}."
              body = "Sensor: #{setpoint.sensor.name}\nRelais: #{setpoint.gpio.name}\nCurrent Temperature: #{current_temp}\nSetpoint Temperature: #{required_temp}\nCritical Temperature: #{min_temp}"

              ErrorMailer.error_email(title, body).deliver
            end
              Log.create(description: "Low TEMPERATURE detected: #{current_temp} on #{setpoint.name}.")
              Relais.on(relais)

          elsif current_temp > required_temp
            Log.create(description: "All OK: #{current_temp} on #{setpoint.name}.")
            Relais.off(relais)
          end
        end
      end
    end

  end
end
