# lib/sensors.rb
class Sensors
  class << self

    def read_all
      puts "Searching ...\n"

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

        end
      return values
    end

    def read_one(sensor)
      sensors = read_all

      address = ""
      if sensor.is_a? Sensor
        address = sensor.address
      elsif sensor.is_a? String
        address = sensor
      end
      if sensors.to_s.include?(address)
        puts "Reading sensor #{address}\n"
        path = "/sys/bus/w1/devices"

        # Find all available sensors
        sensors = Dir.entries(path)

        file = File.open("#{path}/#{address}/w1_slave", "rb")
        contents = file.read
        value = contents.split("t=")
        temp = value[1].to_f / 1000

        puts "Sensor #{address}: #{temp} DegrC\n"
        return {"#{address}" => temp}
      end
    end

    def update

      sensors = read_all()

      sensors.each_with_index do |(sensor, value), index|
        Sensor.find_or_create_by(address: sensor) do |obj|
          puts "Found new sensor ..."

          obj.name = "Sensor #{index}"
          obj.address = sensor
          obj.value = value
          obj.save
          Log.create(description: "CREATE: Sensor #{index} [#{sensor}] with value #{value} &deg;C", value: value, sensor: obj.name)

        end
        sensor = Sensor.find_by(address: sensor)
        unless sensor.nil?
          puts "Updating sensor ..."
          sensor.value = value
          sensor.save
          Log.create(description: "UPDATE: Sensor #{sensor.name} [#{sensor.address}] with value #{sensor.value} &deg;C", value: sensor.value, sensor: sensor.name)
        end
      end


    end

  end
end
