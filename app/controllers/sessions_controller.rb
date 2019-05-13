class SessionsController < ApplicationController
  def create
    #guardem a auth el que rebem de la API quan fem login
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
      
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to issues_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
