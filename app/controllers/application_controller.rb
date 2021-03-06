class ApplicationController < ActionController::API
  before_action :authenticate_request, except: %i[index, verify_token]
  attr_reader :current_user

  # include ExceptionHandler

  # [...]
  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    User.current = @current_user
    render json: {error: "Not Authorized"}, status: 401 unless @current_user
  end
end
