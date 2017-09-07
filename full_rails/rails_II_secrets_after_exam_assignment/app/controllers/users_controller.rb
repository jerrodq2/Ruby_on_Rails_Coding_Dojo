class UsersController < ApplicationController
  before_action :require_login, except: [:new, :sessions, :login, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def sessions
  end

  def login
    user = User.find_by(email: params[:Email])
    if user && user.authenticate(params[:Password])
      session[:id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Invalid'
      redirect_to '/sessions/new'
    end
  end

  def show
    @user = User.includes(:secrets).find(params[:id])
    @sec = Secret.new
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to user_path(user.id)
      session[:id] = user.id
    else
      flash[:errors]=user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.update(params[:id], user_params)
    if user.valid?
      redirect_to user_path(user.id)
    else
      flash[:errors]=user.errors.full_messages
      redirect_to edit_user_path(user.id)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    session.clear
    redirect_to '/sessions/new'
  end

  def logout
    session.clear
    redirect_to '/sessions/new'
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
