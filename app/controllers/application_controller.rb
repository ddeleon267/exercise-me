class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    #can't get this to work??? only works in controllers i guess??
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # binding.pry
    # User.find(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless logged_in?
  end
  ##am i using this method anywhere??
end
