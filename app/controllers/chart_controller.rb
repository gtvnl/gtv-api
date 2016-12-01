class ChartController < ApplicationController
  def index

    values = []
    @logs = Log.where(sensor: "Sensor 2")

    @logs.each do |log|
      values << log.value
    end

    render json: @values, meta: default_meta

  end
end
