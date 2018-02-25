class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    #can't get this to work???
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # binding.pry
    # User.find(session[:user_id])
  end

  private

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end
