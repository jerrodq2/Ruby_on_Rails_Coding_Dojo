class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
      @secrets = Secret.all.includes(:user, :users_liked, :likes)
      @user = current_user
  end
  def create
    secret = User.find(session[:id]).secrets.create(secret_params)
    if !secret.valid?
      flash[:error] = secret.errors.full_messages
    end
    redirect_to user_path(session[:id])
  end
  def destroy
    s = Secret.find(params[:id])
    s.destroy if s.user == current_user
    redirect_to user_path(session[:id])
  end


  private

  def secret_params
    params.require(:secret).permit(:content)
  end
end
