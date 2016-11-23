# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Administrator", email: "r.d.vos@gtv.nl", password: "Admin1234!", password_confirmation: "Admin1234!")
apikey = AuthenticateUser.call("r.d.vos@gtv.nl", "Admin1234!").result
user = User.find_by(email: "r.d.vos@gtv.nl")

user.apikey = apikey
user.save

puts "-------------------------------------------------------\n"
puts "API key = #{apikey} \n"
puts "-------------------------------------------------------\n"

(1..6).each do |index|
  Setpoint.create(name: "Setpoint #{index}", value: -20.0)
end

Gpio.create(name: "Relais 1", gpio: 18, pin: 12)
Gpio.create(name: "Relais 2", gpio: 23, pin: 16)
Gpio.create(name: "Relais 3", gpio: 24, pin: 18)
Gpio.create(name: "Relais 4", gpio: 25, pin: 22)
Gpio.create(name: "Relais 5", gpio: 8, pin: 24)
Gpio.create(name: "Relais 6", gpio: 7, pin: 26)
Gpio.create(name: "Relais 7", gpio: 12, pin: 32)
Gpio.create(name: "Relais 8", gpio: 16, pin: 36)


def readSensors
  path = "/sys/bus/w1/devices"

  # Find all available sensors
  sensors = Dir.entries(path)

  sensors.delete(".")
  sensors.delete("..")
  sensors.delete("w1_bus_master1")

  sensors.each_with_index do |sensor, index|

   file = File.open("#{path}/#{sensor}/w1_slave", "rb")
   contents = file.read
   value = contents.split("t=")
   temp = value[1].to_f / 1000


   Sensor.find_or_create_by(address: sensor) do |sensor|
     sensor.value = temp
     sensor.name = "Sensor #{index}"
   end

   puts "FOUND: Sensor #{sensor}: #{temp} DegrC\n"
  end
end

readSensors()
