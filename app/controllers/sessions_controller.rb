class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new
  end

  def create
    auth = Authentication.new(params, request.env['omniauth.auth'])
    if auth.authenticated?
      session[:user_id] = auth.user.id
      redirect_to root_path
      return
    else
      flash[:danger] = "You could not be authenticated"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
    return
  end
end
