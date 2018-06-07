class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_back(fallback_location: root_path)
  end

  def destroy
    session[:user_id] = nil
    redirect_back(fallback_location: root_path)
  end
end