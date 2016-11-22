module Api::V1
  class SetpointsController < ApplicationController
    before_action :authenticate_request, except: [:index, :show]
    before_action :set_setpoint, only: [:show, :update, :destroy]

    # GET /setpoints
    def index
      @setpoints = Setpoint.all

      render json: @setpoints, meta: default_meta
    end

    # GET /setpoints/1
    def show
      render json: @setpoint, meta: default_meta
    end

    # POST /setpoints
    def create
      @setpoint = Setpoint.new(setpoint_params)

      if @setpoint.save
        render json: @setpoint, status: :created
      else
        render json: @setpoint.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /setpoints/1
    def update
      if @setpoint.update(setpoint_params)
        render json: @setpoint
      else
        render json: @setpoint.errors, status: :unprocessable_entity
      end
    end

    # DELETE /setpoints/1
    def destroy
      @setpoint.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_setpoint
        @setpoint = Setpoint.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def setpoint_params
        params.require(:setpoint).permit(:name, :value)
      end
  end
end
