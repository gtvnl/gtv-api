
# lib/inputs.rb
require 'rpi_gpio'

class Inputs
  class << self

    @@meters = Meter.all

    def poll(pin)
      RPi::GPIO.set_numbering :board
      RPi::GPIO.setup pin, :as => :input

      begin
          if RPi::GPIO.high? pin
            meter = Meter.find_by(pin: pin)
            meter.value += 1
            meter.save
            sleep 1
          end
          sleep 0.1
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
