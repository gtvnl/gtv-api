class LogsController < ApplicationController
  before_action :authenticate_request, only: [:create, :update, :destroy]
  before_action :set_log, only: [:show, :update, :destroy]

  def sensor_2a
    render json: Log.where(sensor: "2a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    # render json: [{name: 'Sensor 2a', data: result}]
  end

  def sensor_2b
    render json: Log.where(sensor: "2b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    # render json: [{name: 'Sensor 2b', data: result}]
  end

  # GET /logs
  def index
    @logs = Log.all

    render json: @logs, meta: default_meta
  end

  # GET /logs/1
  def show
    render json: @log, meta: default_meta
  end

  # POST /logs
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: @log, status: :created, location: @log
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @log.update(log_params)
      render json: @log
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logs/1
  def destroy
    Log.create(description: "DELETE: Log #{log.description}")

    @log.destroy
    redirect_to :back

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_params
      params.require(:log).permit(:description, :value, :sensor)
    end
end
