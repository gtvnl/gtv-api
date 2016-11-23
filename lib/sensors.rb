# lib/sensors.rb
class Sensors
  class << self
    def setup
      RPi::GPIO.set_warnings(false)
      RPi::GPIO.set_numbering :board

      pins = [12, 16, 18, 22, 24, 26, 32, 36]

      pins.each do |pin|
        RPi::GPIO.setup pin, :as => :output, :initialize => :high
      end
    end

    def read_all
      puts "Reading all sensors ...\n"

      path = "/sys/bus/w1/devices"

      # Find all available sensors
      sensors = Dir.entries(path)

      sensors.delete(".")
      sensors.delete("..")
      sensors.delete("w1_bus_master1")

      sensors.each do |sensor|

       file = File.open("#{path}/#{sensor}/w1_slave", "rb")
       contents = file.read
       value = contents.split("t=")
       temp = value[1].to_f / 1000

      puts "Sensor #{sensor}: #{temp} DegrC\n"
      end

    end

    def read_one(sensor)
      puts "Reading sensor #{sensor}\n"
      path = "/sys/bus/w1/devices"

      # Find all available sensors
      sensors = Dir.entries(path)

     file = File.open("#{path}/#{sensor}/w1_slave", "rb")
     contents = file.read
     value = contents.split("t=")
     temp = value[1].to_f / 1000

      puts "Sensor #{sensor}: #{temp} DegrC\n"
    end


  end
end
