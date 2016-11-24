
# lib/inputs.rb
require 'rpi_gpio'

class Inputs
  class << self

    def poll(pin)
      RPi::GPIO.set_numbering :board
      RPi::GPIO.setup pin, :as => :input

      begin
          if RPi::GPIO.high? pin
            meter = Meters.find_by(pin: pin)
            meter.value += 1
            meter.save
            sleep 1
          end
        end while true

    end

    def start_polling

    end

    def stop_polling

    end

  end
end
