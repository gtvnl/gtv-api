class ChartController < ApplicationController
  def index
    @sensor1 = ["Sensor 1"];
    @sensor2 = ["Sensor 2"];

    Log.where.(sensor: Sensor.first) do |sensor|
      @sensor1.push(sensor.value)
    end
    Log.where.(sensor: Sensor.second) do |sensor|
      @sensor2.push(sensor.value)
    end

    return [@sensor1, @sensor2]
  end
end
