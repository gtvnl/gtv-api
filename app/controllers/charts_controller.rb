class ChartsController < ApplicationController
  include AbstractController::Helpers
  include ActionController::Flash
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionView::Layouts

  layout 'chart'



  def index

    render "charts/index"

  end
end
