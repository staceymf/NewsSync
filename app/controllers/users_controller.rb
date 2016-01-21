class UsersController < ApplicationController
  def show
    @user =  User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
