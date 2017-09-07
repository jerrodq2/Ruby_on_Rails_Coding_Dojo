class UsersController < ApplicationController
  before_action :states
  def create
    user = User.create(user_params.merge({state: State.find(user_params[:state])}))
    if user.valid?
      session[:id] = user.id
      session[:name] = user.first_name
      session[:state] = user.state.state
      redirect_to '/events'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def update
    user = User.update(session[:id], user_params.merge({state: State.find(update_user_params[:state])}))
    if !user.valid?
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    else
      session[:name] = user.first_name
      session[:state] = user.state.state
      redirect_to '/events'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :state, :city, :email, :password, :password_confirmation)
  end
  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :state, :city, :email)
  end
end
