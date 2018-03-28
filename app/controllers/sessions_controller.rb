class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: [:destroy]

  def new
    @user = User.new

  end

  def create
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'home'
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end

  def omnicreate
    binding.pry
    # raise auth_hash.inspect
    @user = User.find_or_create_from_auth_hash(auth_hash)
    # @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #   u.name = auth['info']['name']
    #   u.email = auth['info']['email']
    # end
    session[:user_id] = @user.id

    redirect_to home_path #root_path #or home_path????
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def session_params
    params.require(:user).permit(:password, :name, :uid)
  end

end
