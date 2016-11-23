# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.find_or_create_by(email: "r.d.vos@gtv.nl") do |user|
  user.name = "Administrator"
  user.password = "Admin1234!"
  user.password_confirmation = "Admin1234!"
  Log.create(description: "Added an Administrator named '#{user.name}' with password '#{user.password}'")
end

apikey = AuthenticateUser.call("r.d.vos@gtv.nl", "Admin1234!").result
user = User.find_by(email: "r.d.vos@gtv.nl")

user.apikey = apikey
user.save
Log.create(description: "Added an API key for '#{user.name}':'#{apikey}'")

(1..6).each do |index|
  Setpoint.find_or_create_by(name: "Setpoint #{index}") do |setpoint|
    setpoint.name = "Setpoint #{index}"
    setpoint.value = -20.0
  end
end


Gpio.create(name: "Relais 1", gpio: 18, pin: 12, of_type: 'output')
Gpio.create(name: "Relais 2", gpio: 23, pin: 16, of_type: 'output')
Gpio.create(name: "Relais 3", gpio: 24, pin: 18, of_type: 'output')
Gpio.create(name: "Relais 4", gpio: 25, pin: 22, of_type: 'output')
Gpio.create(name: "Relais 5", gpio: 8, pin: 24, of_type: 'output')
Gpio.create(name: "Relais 6", gpio: 7, pin: 26, of_type: 'output')
Gpio.create(name: "Relais 7", gpio: 12, pin: 32, of_type: 'output')
Gpio.create(name: "Relais 8", gpio: 16, pin: 36, of_type: 'output')


Sensor.scan
