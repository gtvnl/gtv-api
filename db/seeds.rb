# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Administrator ...\n"
User.find_or_create_by(email: "r.d.vos@gtv.nl") do |user|
  user.name = "Administrator"
  user.password = "Admin1234!"
  user.password_confirmation = "Admin1234!"
  Log.create(description: "Added an Administrator named '#{user.name}' with password '#{user.password}'")
end

puts "Creating API key ...\n"
apikey = AuthenticateUser.call("r.d.vos@gtv.nl", "Admin1234!").result
user = User.find_by(email: "r.d.vos@gtv.nl")

user.apikey = apikey
user.save
Log.create(description: "Added an API key for '#{user.name}':'#{apikey}'")

puts "Creating Setpoints ...\n"
(1..6).each do |index|
  Setpoint.find_or_create_by(name: "Setpoint #{index}") do |setpoint|
    setpoint.name = "Setpoint #{index}"
    setpoint.value = -20.0
  end
end

puts "Creating GPIOs ...\n"
Gpio.create(name: "Relais 1", gpio_number: 18, pin: 12, of_type: 'output')
Gpio.create(name: "Relais 2", gpio_number: 23, pin: 16, of_type: 'output')
Gpio.create(name: "Relais 3", gpio_number: 24, pin: 18, of_type: 'output')
Gpio.create(name: "Relais 4", gpio_number: 25, pin: 22, of_type: 'output')
Gpio.create(name: "Relais 5", gpio_number: 8, pin: 24, of_type: 'output')
Gpio.create(name: "Relais 6", gpio_number: 7, pin: 26, of_type: 'output')
Gpio.create(name: "Relais 7", gpio_number: 12, pin: 32, of_type: 'output')
Gpio.create(name: "Relais 8", gpio_number: 16, pin: 36, of_type: 'output')

if RbConfig::CONFIG['host_os'] == "linux-gnueabihf"
  puts "Scanning for Sensors ...\n"
  Sensors.scan
else
  puts "No Raspberry detected. Skipping Sensors Import ..."
end
