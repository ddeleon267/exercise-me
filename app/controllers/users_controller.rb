class UsersController < ApplicationController
  #could do a before_action here, if i decide to add additional actions here; e.g. edit/update/delete. unsure.
  before_action :require_logged_in, except: [:new, :create]

  def new
    #redirect_if_logged_in
    @user = User.new
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @user_workouts = @user.workouts #maybe this should bein the model?
  end

  def home
    @user = current_user
    @workouts = Workout.all
    @exercises = Exercise.all
    @users = User.all
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :new
    end

    #could choose to do it this way. idk if i like it tho; not so readable
    # @user.save ? (session[:user_id] = @user.id; redirect_to home_path ) : (render :new)
  end

  #could allow user to edit/update profile, would need form for that

  #could allow user to destroy profile

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
