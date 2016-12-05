class ChartsController < ApplicationController
  include AbstractController::Helpers
  include ActionController::Flash
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionView::Layouts

  layout 'chart'

  def sensor_2a
    render json: Log.where(sensor: "2a").pluck(:value)
  end

  def sensor_2b
    render json: Log.where(sensor: "2b").pluck(:value)
  end

  def index


    render "charts/index"

  end
end
