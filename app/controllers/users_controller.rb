class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, except: [:new, :create]
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
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

  def home  #maybe just grab the last few here rather than in view?
    @user = current_user
    @workouts = Workout.all
    @exercises = Exercise.all
    @users = User.all
  end

  def show
    @user_workouts = @user.workouts #maybe this should be in the model?
  end

  def edit
    redirect_to root_path unless @user.id == current_user.id
  end

  def update #might choose to redirect to profile page
    @user.update(user_params) ? (redirect_to home_path) : (render :edit)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :uid)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
