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

(1...6).each do |index|
  Setpoint.create(name: "Setpoint #{index}", value: -20.0)
end

(1...18).each do |index|
  Sensor.create(name: "Sensor #{index}", value: -20)
end
