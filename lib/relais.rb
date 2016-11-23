# lib/relais.rb
class Relais
  class << self

    def switch_on(number)
      RPi::GPIO.set_low number
    end

    def switch_off(number)
      RPi::GPIO.set_high number
    end

  end
end
