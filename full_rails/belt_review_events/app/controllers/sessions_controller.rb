class SessionsController < ApplicationController
  before_action :states
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if !user
      flash[:error] = 'Invalid email'
      redirect_to new_session_path
    elsif !user.authenticate(params[:password])
      flash[:error] = 'Invalid password'
      redirect_to new_session_path
    else
      session[:id] = user.id
      session[:name] = user.first_name
      session[:state] = user.state.state
      redirect_to '/events'
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end
