
# lib/relais.rb
require 'listen'

class Inputs
  class << self

    def start_polling
      kwh1 = Pathname.new("/sys/class/gpio/gpio11/")
      kwh2 = Pathname.new("/sys/class/gpio/gpio5/")
      kwh3 = Pathname.new("/sys/class/gpio/gpio6/")
      kwh4 = Pathname.new("/sys/class/gpio/gpio13/")
      kwh5 = Pathname.new("/sys/class/gpio/gpio19/")
      kwh6 = Pathname.new("/sys/class/gpio/gpio21/")

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
