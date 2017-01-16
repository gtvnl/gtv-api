class Setpoints
  class << self

    def send_email(setpoint, current_temp, desired_temp, min_temp, highlow)


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

          current_temp = Serial.read["#{setpoint.sensor[:name]}"]
          desired_temp = setpoint.value
          min_temp = setpoint.value - setpoint.max_temp_difference
          max_temp = setpoint.value + setpoint.max_temp_difference

          if current_temp < desired_temp

            if current_temp <= min_temp
              # TEMP CRITICAL LOW EMAIL
              Relais.on(relais)
              send_email(setpoint, current_temp, desired_temp, min_temp, "LOW")
              Log.create(description: "CRITICALLY LOW TEMPERATURE detected: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value, sensor: setpoint.sensor.name)

            else
              # Turn on heating ribbons
              Relais.on(relais)
              Log.create(description: "Low TEMPERATURE detected: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value, sensor: setpoint.sensor.name)
            end

          elsif current_temp = desired_temp
            # Turn off heating ribbons
            # TEMP ACQUIRED EMAIL
            Relais.off(relais)

            Log.create(description: "DESIRED TEMPERATURE ACQUIRED: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value, sensor: setpoint.sensor.name)
          elsif current_temp > max_temp
            # TEMP CRITICAL HIGH EMAIL
            Relais.off(relais)
            send_email(setpoint, current_temp, desired_temp, min_temp, "HIGH")
            Log.create(description: "CRITICALLY HIGH TEMPERATURE detected: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value, sensor: setpoint.sensor.name)

          end
        end
      end
    end

  end
end
