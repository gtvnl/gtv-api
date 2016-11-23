class GpiosController < ApplicationController
  before_action :set_gpio, only: [:show, :update, :destroy]

  # GET /gpios
  def index
    @gpios = Gpio.all

    render json: @gpios
  end

  # GET /gpios/1
  def show
    render json: @gpio
  end

  # POST /gpios
  def create
    @gpio = Gpio.new(gpio_params)

    if @gpio.save
      render json: @gpio, status: :created, location: @gpio
    else
      render json: @gpio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gpios/1
  def update
    if @gpio.update(gpio_params)
      render json: @gpio
    else
      render json: @gpio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gpios/1
  def destroy
    @gpio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpio
      @gpio = Gpio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gpio_params
      params.require(:gpio).permit(:name, :gpio, :pin)
    end
end
