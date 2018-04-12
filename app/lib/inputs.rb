require 'rpi_gpio'

class Inputs
  class << self

    def check_power_supply
      @gpio = Gpio.find_by(name: "Check Power Supply")

      unless @gpio.pin.nil?
        RPi::GPIO.set_numbering :board
        RPi::GPIO.setup @gpio.pin, :as => :input, :pull => :up

        if RPi::GPIO.high? @gpio.pin
          @gpio.is_on = false
          @gpio.save
          Log.create(description: "POWER SUPPLY INTERRUPTION DETECTED.")
          CheckPowerSupplyMailer.check_power_supply("POWER SUPPLY INTERRUPTION DETECTED #{Time.now}","Please take actions ASAP").deliver
        else
          @gpio.is_on = true
          @gpio.save
        end
      end
    end
  end
end
