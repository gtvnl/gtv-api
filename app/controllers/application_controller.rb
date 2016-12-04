class ApplicationController < ActionController::API
  ###include ActionController::Serialization

  attr_reader :current_user

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def default_meta
    {
      licence: 'CC-0',
      authors: ['Ramsy de Vos'],
      api_version: 1,
      latest_api_update: "2016-10-30T17:23:38.000Z"
    }
  end


end
