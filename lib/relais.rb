# lib/relais.rb
require 'rpi_gpio'

class Relais
  class << self

    @@pins = Gpio.where(of_type: 'output')

    def setup(quiet: false)
      RPi::GPIO.set_warnings(false)
      RPi::GPIO.set_numbering :board

      @@pins.each do |pin|
        RPi::GPIO.setup pin.pin, :as => :output
        if quiet == false
          Log.create(description: "Initialised #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio_number}) as OUTPUT")
        end
      end

    end

    def on(pin_number)
      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        RPi::GPIO.set_low pin.pin
        Log.create(description: "Switched ON #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio_number})")
      else
        Log.create(description: "ERROR: GPIO on pin #{pin_number} not configured. Check your configuration")
      end

    end

    def off(pin_number)
      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        RPi::GPIO.set_high pin.pin
        Log.create(description: "Switched OFF #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio_number})")
      else
        Log.create(description: "ERROR: GPIO on pin #{pin_number} not configured. Check your configuration")
      end
    end

    def all_on
      setup(quiet: true)
      @@pins.each do |pin|
        on(pin.pin)
      end
    end

    def all_off
      @@pins.each do |pin|
        off(pin.pin)
      end
    end

  end
end
