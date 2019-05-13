

# class ApplicationController < ActionController::Base
  
#   helper_method :current_user
#   #skip_before_action :authenticate_user!
  
#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#     rescue ActiveRecord::RecordNotFound
#   end 
  
#   # before_action :require_login

#   # def require_login
#   #   redirect_to "/" unless current_user
#   # end
  
#   #protect_from_forgery with: :exception
#   #skip_before_action: verify_authenticity_token
#   helper_method :current_user
# end

class ApplicationController < ActionController::Base
  before_action :set_current_user, :authenticate_request

  def current_user
      @current_user
  end
  helper_method :current_user

  def set_current_user
    @auth = session[:omniauth] if session[:omniauth]
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @auth_command = AuthorizeApiRequest.call(request.headers)
      if @auth_command.success?
        @current_user = @auth_command.result
      end
    end
  end

  def authenticate_request
    unless @current_user
      render json: { error: @auth_command.errors.values[0].first },
             status: @auth_command.errors.keys[0]
    end
  end
end