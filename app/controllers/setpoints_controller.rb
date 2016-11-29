
  class SetpointsController < ApplicationController
    before_action :authenticate_request, except: [:index, :show]
    before_action :set_setpoint, only: [:show, :update, :destroy]

    # GET /setpoints
    def index
      @setpoints = Setpoint.includes(:sensor, :gpio)
      render json: @setpoints, include: ['sensor', 'gpio'], meta: default_meta
    end

    # GET /setpoints/1
    def show
      render json: @setpoint, include: ['sensor', 'gpio'], meta: default_meta
    end


    # POST /setpoints
    def create
      @setpoint = Setpoint.new(setpoint_params)

      if @setpoint.save
        Log.create(description: "CREATE: Setpoint #{@setpoint.name} with value #{@setpoint.value} &deg;C", value: @setpoint.value)

        render json: @setpoint, status: :created
      else
        Log.create(description: "ERROR: Creating Setpoint #{@setpoint.name} with value #{@setpoint.value} &deg;C [#{@setpoint.errors}]")

        render json: @setpoint.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /setpoints/1
    def update
      if @setpoint.update(setpoint_params)
        Log.create(description: "UPDATE: Setpoint #{@setpoint.name} with value #{@setpoint.value} &deg;C", value: @setpoint.value)

        render json: @setpoint
      else
        Log.create(description: "ERROR: Updating Setpoint #{@setpoint.name} with value #{@setpoint.value} &deg;C [#{@setpoint.errors}]")

        render json: @setpoint.errors, status: :unprocessable_entity
      end
    end

    # DELETE /setpoints/1
    def destroy
      Log.create(description: "DELETE: Setpoint #{@setpoint.name} with value #{@setpoint.value} &deg;C", value: @setpoint.value)

      @setpoint.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_setpoint
        @setpoint = Setpoint.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def setpoint_params
        params.require(:setpoint).permit(:name, :value, :sensor, :gpio)
      end
  end
