class MetersController < ApplicationController
  before_action :set_meter, only: [:show, :update, :destroy]

  # GET /meters
  def index
    @meters = Meter.all

    render json: @meters
  end

  # GET /meters/1
  def show
    render json: @meter
  end

  # POST /meters
  def create
    @meter = Meter.new(meter_params)

    if @meter.save
      render json: @meter, status: :created, location: @meter
    else
      render json: @meter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meters/1
  def update
    if @meter.update(meter_params)
      render json: @meter
    else
      render json: @meter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meters/1
  def destroy
    @meter.destroy
    redirect_to :back

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meter
      @meter = Meter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meter_params
      params.require(:meter).permit(:name, :value, :gpio, :pin)
    end
end
