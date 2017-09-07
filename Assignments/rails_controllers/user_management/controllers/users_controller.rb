class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.update(params[:id], user_params)
    if user.valid?
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
