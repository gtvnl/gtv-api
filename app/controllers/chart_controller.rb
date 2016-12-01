class ChartController < ApplicationController
  def index
    @sensor1 = Sensor.find_by(id: 1)
    @sensor2 = Sensor.find_by(id: 2)
    @sensor3 = Sensor.find_by(id: 3)
    @sensor4 = Sensor.find_by(id: 4)
    @sensor5 = Sensor.find_by(id: 5)
    @sensor6 = Sensor.find_by(id: 6)

    @sa1 = ["Sensor 1"];
    @sa2 = ["Sensor 2"];
    @sa3 = ["Sensor 3"];
    @sa4 = ["Sensor 4"];
    @sa5 = ["Sensor 5"];
    @sa6 = ["Sensor 6"];

    Log.where(sensor: @sensor1) do |sensor|
      @sa1 << sensor.value
    end
    Log.where(sensor: @sensor2) do |sensor|
      @sa2 << sensor.value
    end
    Log.where(sensor: @sensor3) do |sensor|
      @sa3 << sensor.value
    end
    Log.where(sensor: @sensor4) do |sensor|
      @sa4 << sensor.value
    end
    Log.where(sensor: @sensor5) do |sensor|
      @sa5 << sensor.value
    end
    Log.where(sensor: @sensor6) do |sensor|
      @sa6 << sensor.value
    end


    @total = [@sa1, @sa2, @sa3, @sa4, @sa5, @sa6]

    render json: @total, meta: default_meta

  end
end
