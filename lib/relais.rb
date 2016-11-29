# lib/relais.rb
require 'rpi_gpio'

class Relais
  class << self

      RPi::GPIO.set_warnings(false)
      RPi::GPIO.set_numbering :board


    def on(pin_number)
      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        if !pin.is_on?
          RPi::GPIO.setup pin.pin, :as => :output, :initialize => :low
          # RPi::GPIO.set_low pin.pin
          pin.update_column(:is_on, true)

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
      pin = Gpio.find_by(pin: pin_number)
      unless pin.nil?
        if pin.is_on?
          RPi::GPIO.setup pin.pin, :as => :output, :initialize => :high
          pin.update_column(:is_on, false)

          pin.end_time = Time.now
          seconds_run = TimeDifference.between(pin.start_time, pin.end_time).in_seconds
          pin.operating_seconds += seconds_run
          pin.is_on = false
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
