# lib/relais.rb
require 'rpi_gpio'

class Relais
  class << self

    @@pins = Gpio.where(of_type: 'output')
    @@setup =  Gpio.where(is_on: true).size


    def setup
      if @@setup > 0
        RPi::GPIO.set_warnings(false)
        RPi::GPIO.set_numbering :board

        @@pins.each do |pin|
          RPi::GPIO.setup pin.pin, :as => :output
        end
      end
    end

    def on(pin_number)
      setup

      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        if !pin.is_on?
          RPi::GPIO.set_low pin.pin
          pin.start_time = Time.now
          pin.save

          Log.create(description: "Switched ON #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio_number})")

        else
          puts "#{pin} is already switched on."
        end
      else
        Log.create(description: "ERROR: GPIO on pin #{pin_number} not configured. Check your configuration")
      end
    rescue
      puts "GPIOs are not initialised yet. Run 'Relais.setup' first."
    end

    def off(pin_number)
      setup

      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        if pin.is_on?

          RPi::GPIO.set_high pin.pin

          pin.end_time = Time.now
          seconds_run = TimeDifference.between(pin.start_time, pin.end_time).in_seconds
          pin.operating_seconds += seconds_run
          pin.save
          Log.create(description: "Switched OFF #{pin.name} (PIN:#{pin.pin}/GPIO:#{pin.gpio_number})")

        else
          puts "#{pin} is already switched off."
        end
      else
        Log.create(description: "ERROR: GPIO on pin #{pin_number} not configured. Check your configuration")
      end
    end

    def all_on
      setup

      @@pins.each do |pin|
        on(pin.pin)
      end
    end

    def all_off
      setup

      @@pins.each do |pin|
        off(pin.pin)
      end
    end

  end
end
