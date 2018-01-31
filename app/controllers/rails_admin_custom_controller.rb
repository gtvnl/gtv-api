class RailsAdminCustomController < ApplicationController
  # RailsAdmin support
  # include AbstractController::Helpers
  # include ActionController::Flash
  # include ActionController::RequestForgeryProtection
  # include ActionController::MimeResponds
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # include ActionView::Layouts

  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == 'pi' && md5_of_password == '67f3e8545abf35dbd5f96a79e0858ef6'
    end
  end

end
