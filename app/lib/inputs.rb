
# lib/inputs.rb
require 'rpi_gpio'

class Inputs
  class << self


    def check_power
      @gpio = Gpio.find_by(name: "Check Power Supply")

      unless @gpio.pin.nil?
        RPi::GPIO.set_numbering :board
        RPi::GPIO.setup @gpio.pin, :as => :input

        if RPi::GPIO.high?
          Log.create(description: "POWER SUPPLY INTERRUPTION DETECTED.")
          CheckPowerSupplyMailer.check_power_supply("POWER SUPPLY INTERRUPTION DETECTED #{Time.now}","Please take actions ASAP").deliver
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
