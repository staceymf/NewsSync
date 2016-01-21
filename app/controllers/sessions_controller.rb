class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user.password_hash == params[:password]
      session[:user_id] = user.id
    end
  end

  def destroy
    session[:user_id] = nil
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
