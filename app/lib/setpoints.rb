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

          if (current_temp - 1.0) < desired_temp
            Relais.on(relais)

            if current_temp <= min_temp # TEMP CRITICAL LOW EMAIL
              send_email(setpoint, current_temp, desired_temp, min_temp, "LOW")
              Log.create(description: "CRITICALLY LOW TEMPERATURE detected: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value)
            else
              Log.create(description: "Low TEMPERATURE detected: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value)
            end

          elsif current_temp > desired_temp
            Relais.off(relais)

            if current_temp >= max_temp # TEMP CRITICAL HIGH EMAIL
              send_email(setpoint, current_temp, desired_temp, min_temp, "HIGH")
              Log.create(description: "CRITICALLY HIGH TEMPERATURE detected: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value)
            else   # TEMP ACQUIRED EMAIL
              Log.create(description: "DESIRED TEMPERATURE ACQUIRED: #{current_temp} on #{setpoint.name}.", setpoint_value: setpoint.value)
            end
          end
          # else
          #   #toggle
          #
          #   if setpoint.gpio.is_on
          #     Relais.off(relais)
          #   else
          #     Relais.on(relais)
          #   end

          end
        end
      end
    end

  end
