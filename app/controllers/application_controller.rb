

class ApplicationController < ActionController::Base
  before_action :require_login

  private
  
    def require_login
      unless !defined?(current_user)
        redirect_to "/"
      end
    end
  protect_from_forgery with: :exception
  helper_method :current_user

 
end