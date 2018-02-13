class SessionsController < ApplicationController

  def new
    @user = User.new
    #rendersview implicityly bc shares the same name. will have to add more here if that changes
  end

  def create
      # binding.pry
      @user = User.find_by(username: params[:user][:username])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'home'
      else
        redirect_to signin_path
      end
  end

  def destroy
    session.delete :user_id
        # or session[:user_id] = nil
        # redirect_to '/'
    redirect_to root_url
  end

end
