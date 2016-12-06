class GpiosController < ApplicationController
  before_action :authenticate_request, except: [:index, :show]
  before_action :set_gpio, only: [:show, :update, :destroy]

  # GET /gpios
  def index
    @gpios = Gpio.all

    render json: @gpios, meta: default_meta
  end

  # GET /gpios/1
  def show
    render json: @gpio, meta: default_meta
  end

  # POST /gpios
  def create
    @gpio = Gpio.new(gpio_params)

    if @gpio.save
      Log.create(description: "CREATE: GPIO #{@gpio.name} (GPIO:#{@gpio.gpio_number}/PIN:#{@gpio.pin}")
      render json: @gpio, status: :created, location: @gpio
    else
      Log.create(description: "ERROR: Creating GPIO #{@gpio.name} (GPIO:#{@gpio.gpio_number}/PIN:#{@gpio.pin}) [#{@gpio.errors}]")

      render json: @gpio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gpios/1
  def update
    if @gpio.update(gpio_params)
      # Turn relais on / off with manual update
      if @gpio.is_on
        Relais.on(@gpio.pin)
      else
        Relais.off(@gpio.pin)
      end

      Log.create(description: "UPDATE: GPIO #{@gpio.name} (GPIO:#{@gpio.gpio_number}/PIN:#{@gpio.pin}")
      render json: @gpio
    else
      Log.create(description: "ERROR: Updating GPIO #{@gpio.name} (GPIO:#{@gpio.gpio_number}/PIN:#{@gpio.pin}) [#{@gpio.errors}]")
      render json: @gpio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gpios/1
  def destroy
    Log.create(description: "DELETE: GPIO #{@gpio.name} (GPIO:#{@gpio.gpio_number}/PIN:#{@gpio.pin}")
    @gpio.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpio
      @gpio = Gpio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gpio_params
      params.require(:gpio).permit(:name, :gpio_number, :pin, :of_type)
    end
end
