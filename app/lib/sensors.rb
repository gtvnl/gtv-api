class Sensors
  class << self

    def update
      Serial.read.each do |key,value|

      s = Sensor.find_by(name: key)
      name = s.name

        unless s.nil?
          s.value = value
          s.save
          Log.create(description: "UPDATE: Sensor #{name} with value #{value} &deg;C", value: value, sensor: name)

        end
      end
    end

  end
end
