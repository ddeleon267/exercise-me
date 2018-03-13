class UsersController < ApplicationController
  #could do a before_action here, if i decide to add additional actions here; e.g. edit/update/delete
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @user_workouts = @user.workouts
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
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
