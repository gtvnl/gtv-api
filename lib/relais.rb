# lib/relais.rb
require 'rpi_gpio'

class Relais
  class << self

    def initialize
      RPi::GPIO.set_warnings(false)
      RPi::GPIO.set_numbering :board
    end

    def switch_on(number)
      RPi::GPIO.set_low number
    end

    def switch_off(number)
      RPi::GPIO.set_high number
    end

  end
end
