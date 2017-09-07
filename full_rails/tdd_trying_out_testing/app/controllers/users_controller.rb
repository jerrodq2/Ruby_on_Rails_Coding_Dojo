class UsersController < ApplicationController
  def index
    @user = User.new
  end
  def create
  @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
  if @user.save
    flash[:notice] = 'User successfully created'
    redirect_to action: 'index'
  else
    #errors we need to code later
  end
end
end
