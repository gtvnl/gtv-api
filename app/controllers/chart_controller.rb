class ChartController < ApplicationController
  def index

    @total = []
    sensor0_values = []
    sensor2_values = []

    @sensor0 = Log.where(sensor: "Sensor 0")
    @sensor2 = Log.where(sensor: "Sensor 2")

    @sensor0.each do |log|
      sensor0_values.push(log.value)
    end

    @sensor2.each do |log|
      sensor0_values.push(log.value)
    end

    @total.push(sensor0)
    @total.push(sensor2)
    render json: @total, meta: default_meta

  end
end
