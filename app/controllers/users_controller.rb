class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def home

  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'home'
    #so this works but i don't want it to redirect this way
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
