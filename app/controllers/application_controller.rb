

class ApplicationController < ActionController::Base
  before_action :require_login

  private
    def require_login
      unless !defined?(current_user) or current_user
        redirect_to "/"
      end
    end
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end