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

          current_temp = Serial.read["#{setpoint.sensor[:name]}"]
          desired_temp = setpoint.value
          min_temp = setpoint.value - setpoint.max_temp_difference
          max_temp = setpoint.value + setpoint.max_temp_difference

          if current_temp < desired_temp
            Relais.on(relais)

            # if current_temp <= min_temp # TEMP CRITICAL LOW EMAIL
            # else
            # end

          elsif current_temp >= desired_temp
            Relais.off(relais)

            # if current_temp >= max_temp # TEMP CRITICAL HIGH EMAIL
            # else   # TEMP ACQUIRED EMAIL
            # end
          end

        end
      end
    end
  end
end
