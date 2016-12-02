
# lib/inputs.rb
require 'rpi_gpio'

class Inputs
  class << self


    def check_power_supply
      @gpio = Gpio.find_by(name: "Check Power Supply")

      unless @gpio.pin.nil?
        RPi::GPIO.set_numbering :board
        RPi::GPIO.setup 13, :as => :input, :pull => :up

        if RPi::GPIO.high? 11
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

    @@meters = Meter.all

    def poll(pin)
      RPi::GPIO.set_numbering :board
      RPi::GPIO.setup 11, :as => :input

      begin
          if RPi::GPIO.high? pin
            meter = Meter.find_by(pin: pin)
            meter.value += 1
            meter.save
            sleep 1
          end
          # sleep 0.1
        end while true

    end

    def start_polling
      @@meters.each do |meter|
        Thread.new do
          poll(meter.pin)
        end
      end

    end

    def stop_polling

    end

  end
end
