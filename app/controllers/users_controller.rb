class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, except: [:new, :create]
  before_action :redirect_if_logged_in, except: [:show, :home, :edit, :update]

  def new
    @user = User.new
  end

  def show
    @user_workouts = @user.workouts #maybe this should be in the model?
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

  def edit
    #do i need to do something extra to protect against unauth users?
  end

  def update
    #this is not updating because of password validations
    @user.update(user_params) ? (redirect_to home_path) : (render :edit)
  end

  def destroy
    #doesn't do anything yet
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :uid)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
