class Sensors
  class << self




    def update
      Serial.read.each do |key,value|

      s = Sensor.find_by(name: key)

        unless s.nil?
          s.update(value: value)
        end
      end
    end

  end
end
