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
          puts "Initialised #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio})"
        end
      end

    end

    def on(pin_number)
      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        setup(quiet: true)
        RPi::GPIO.set_low pin.pin
        puts "Switched ON #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio})"
      else
        puts "GPIO on pin #{pin_number} not configured. Check your configuration"
      end

    end

    def off(pin_number)
      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        setup(quiet: true)
        RPi::GPIO.set_high pin.pin
        puts "Switched OFF #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio})"
      else
        puts "GPIO on pin #{pin_number} not configured. Check your configuration"
      end
    end

    def all_on
      setup(quiet: true)
      @@pins.each do |pin|
        RPi::GPIO.set_low pin.pin
        puts "Switched ON #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio})"
      end
    end

    def all_off
      setup(quiet: true)
      @@pins.each do |pin|
        RPi::GPIO.set_high pin.pin
        puts "Switched OFF #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio})"
      end
    end

  end
end
