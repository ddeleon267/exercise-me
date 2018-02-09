class SessionsController < ApplicationController

  def new
    # @user = User.new
  end
#
# def create
#   user = User.find_by(name: params[:user][:name])
#
#   user = user.try(:authenticate, params[:user][:password])
#
#   return redirect_to(controller: 'sessions', action: 'new') unless user
#
#   session[:user_id] = user.id
#
#   @user = user
#
#   redirect_to controller: 'welcome', action: 'home'
# end
#
# def destroy
#   session.delete :user_id
#   or session[:user_id] = nil
#   redirect_to '/'
# or redirect_to root_url
# end


# def create
#     @user = User.find_by(name: params[:user][:name])
#     if @user && @user.authenticate(params[:user][:password])
#       session[:user_id] = @user.id
#       redirect_to user_path(@user), notice: "Welcome back to the theme park!"
#     else
#       redirect_to signin_path
#     end
#   end
end
