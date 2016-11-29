class ChartController < ApplicationController
  def index
    hash = Hash.new

    @sensors = Sensor.all

    @sensors.each do |sensor|
      @logs = Log.where(sensor: sensor.name)

      @logs.each do |log|
        newHash = {
          sensor: log.sensor
          value: log.value
          date: log.created_at
        }
        hash.merge!(newHash)
      end


    end

    render json: hash
  end
end
