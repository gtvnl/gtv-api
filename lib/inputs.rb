
# lib/relais.rb
require 'listen'

class Inputs
  class << self

    def start

    end

    def start_polling
      kwh1 = Pathname.new("/sys/class/gpio/gpio11/value")
      kwh2 = Pathname.new("/sys/class/gpio/gpio5/value")
      kwh3 = Pathname.new("/sys/class/gpio/gpio6/value")
      kwh4 = Pathname.new("/sys/class/gpio/gpio13/value")
      kwh5 = Pathname.new("/sys/class/gpio/gpio19/value")
      kwh6 = Pathname.new("/sys/class/gpio/gpio21/value")

      kwhs = [kwh1, kwh2, kwh3, kwh4, kwh5, kwh6]

      kwhs.each do |kwh|
        begin
          gpio = kwh.to_s.match(/\d+/)[0].to_i

          meter = Meters.find_by(gpio: gpio)

          listener = Listen.to(kwh) do |modified|
            meter.value += 1
            meter.save
          end

          listener.start # not blocking
        rescue
          Log.create(description: "ERROR: Polling #{kwh}")
        end
      end
    end

    def stop_polling
      Listen.stop
    end

  end
end
