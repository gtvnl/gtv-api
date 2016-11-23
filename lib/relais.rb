# lib/relais.rb
require 'rpi_gpio'

class Relais
  class << self

    @@pins = [12, 16, 18, 22, 24, 26, 32, 36]

    def setup
      RPi::GPIO.set_warnings(false)
      RPi::GPIO.set_numbering :board

      @@pins.each do |pin|
        RPi::GPIO.setup pin, :as => :output
      end
    end

    def on(number)
      setup
      RPi::GPIO.set_low number
    end

    def off(number)
      setup
      RPi::GPIO.set_high number
    end

    def all_on
      setup
      @@pins.each do |pin|
        RPi::GPIO.set_low pin
      end
    end

    def all_off
      setup
      @@pins.each do |pin|
        RPi::GPIO.set_high pin
      end
    end

  end
end
