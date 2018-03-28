class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user

    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to login_path unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to home_path if logged_in?
  end

  def redirect_if_unauthorized
    unauth_user_access = params[:user_id] && current_user.id != params[:user_id].to_i
    unauth_workout_access = params[:id] && !current_user.workouts.map{|w| w.id}.include?(params[:id].to_i)

    home_path if unauth_user_access || unauth_workout_access

    #examples to test
    ## workouts/1/edit --- good
    ## workouts/2/edit ---- good
    ## workout edit button on show page-- good
    ## users/28/workouts/2/edit --- good
    ## users/27/workouts/2/edit --- good
    ## users/28/workouts/1/edit --- good
  end
end
