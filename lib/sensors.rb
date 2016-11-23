# lib/sensors.rb
class Sensors
  class << self

    def read_all
      puts "Reading all sensors ...\n"

      path = "/sys/bus/w1/devices"

      # Find all available sensors
      sensors = Dir.entries(path)

      sensors.delete(".")
      sensors.delete("..")
      sensors.delete("w1_bus_master1")

      values = {}

      sensors.each do |sensor|

        file = File.open("#{path}/#{sensor}/w1_slave", "rb")
        contents = file.read
        value = contents.split("t=")
        temp = value[1].to_f / 1000

        values.merge!("#{sensor}": temp)
        puts "Sensor #{sensor}: #{temp} DegrC\n"

      end
        return values
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
      return {"#{sensor}": temp}
    end

    def scan
      puts "Scanning available sensors ..."

      sensors = read_all()

      sensors.each_with_index do |(sensor, value), index|
        Sensor.find_or_create_by(address: sensor) do |obj|
          obj.name = "Sensor #{index}"
          obj.address = sensor
          obj.value = value
        end
        sensor = Sensor.find_by(address: sensor)
        unless sensor.nil?
          sensor.value = value
          sensor.save
        end
      end


    end

  end
end
