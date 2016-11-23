require 'rpi_gpio'

setpoint = 25

def setupPins

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :board

pins = [12, 16, 18, 22, 24, 26, 32, 36]

  pins.each do |pin|
    RPi::GPIO.setup pin, :as => :output, :initialize => :high
  end
end


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

  #puts "Sensor #{sensor}: #{temp} DegrC\n"
  return temp
end


setupPins()
temp = readSensor("28-000007c5b9e2")

if (temp < setpoint)
  puts "Temperature TOO LOW: #{temp}"
  RPi::GPIO.set_low 12
else
  puts "Temperature OK: #{temp}"
  RPi::GPIO.set_high 12
end
#RPi::GPIO.clean_up


#readSensors
