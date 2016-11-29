class ChartController < ApplicationController
  def index
    hash = Hash.new

    @sensors = Sensor.all

    @sensors.each do |sensor|
      @logs = Log.where(sensor: sensor.name)

      @logs.each do |log|
puts log.value

      end

    end

    render json: hash
  end
end
