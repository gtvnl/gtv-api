class SensorsController < ApplicationController
  before_action :authenticate_request, except: [:index, :show]
  before_action :set_sensor, only: [:show, :update, :destroy]

  # GET /sensors
  def index
    @sensors = Sensor.all

    render json: @sensors, meta: default_meta
  end

  # GET /sensors/1
  def show
    render json: @sensor, meta: default_meta
  end

  # POST /sensors
  def create
    @sensor = Sensor.new(sensor_params)

    if @sensor.save
      Log.create(description: "CREATE: Sensor #{@sensor.name} with value #{@sensor.value} °C", value: @sensor.value, sensor: @sensor.name)

      render json: @sensor, status: :created
    else
      Log.create(description: "ERROR: Creating Sensor #{@sensor.name} with value #{@sensor.value} °C [#{@sensor.errors}]")

      render json: @sensor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sensors/1
  def update
    if @sensor.update(sensor_params)
      Log.create(description: "UPDATE: Sensor #{@sensor.name} with value #{@sensor.value} °C", value: @sensor.value, sensor: @sensor.name)

      render json: @sensor
    else
      Log.create(description: "ERROR: Updating Sensor #{@sensor.name} with value #{@sensor.value} °C [#{@sensor.errors}]")

      render json: @sensor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sensors/1
  def destroy
    Log.create(description: "DELETE: Sensor #{@sensor.name} with value #{@sensor.value} °C", value: @sensor.value, sensor: @sensor.name)

    @sensor.destroy
    redirect_to :back

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sensor_params
      params.require(:sensor).permit(:name, :location, :value)
    end
end
