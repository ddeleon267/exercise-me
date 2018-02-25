class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find_by(session[:id])
  end
end
