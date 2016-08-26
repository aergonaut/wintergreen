class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private

  def authenticate_user
    unless current_user.present?
      session[:user_id] = nil
      redirect_to new_session_path
      return
    end
  end

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method :current_user
end
