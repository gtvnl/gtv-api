def readSensors

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


def readSensor(sensor)

  path = "/sys/bus/w1/devices"

  # Find all available sensors
  sensors = Dir.entries(path)

   file = File.open("#{path}/#{sensor}/w1_slave", "rb")
   contents = file.read
   value = contents.split("t=")
   temp = value[1].to_f / 1000

  puts "Sensor #{sensor}: #{temp} DegrC\n"

end



readSensors
readSensor("28-000007c5b9e2")
