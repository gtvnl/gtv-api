# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  #skip_before_action :authenticate_request

  def index
  end

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      Log.create(description: "AUTHENTICATE: User with email #{params[:email]} successfully authenticated. [#{command.result}]")
      render json: { auth_token: command.result }
    else
      Log.create(description: "UNAUTHORIZED: #{params[:email]} / #{params[:password]} tried to authenticate. [#{command.errors}]")
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
