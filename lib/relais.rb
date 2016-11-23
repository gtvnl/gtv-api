# lib/relais.rb
require 'rpi_gpio'

pins = [12, 16, 18, 22, 24, 26, 32, 36]

class Relais
  class << self

    def setup
      RPi::GPIO.set_warnings(false)
      RPi::GPIO.set_numbering :board

      pins.each do |pin|
        RPi::GPIO.setup pin, :as => :output, :initialize => :high
      end
    end

    def on(number)
      RPi::GPIO.set_low number
    end

    def off(number)
      RPi::GPIO.set_high number
    end

    def all_on
      pins.each do |pin|
        RPi::GPIO.set_low pin
      end
    end

    def all_off
      pins.each do |pin|
        RPi::GPIO.set_high number
      end
    end

  end
end