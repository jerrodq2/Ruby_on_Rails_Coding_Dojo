class LikesController < ApplicationController
  before_action :require_login
  before_action :require_correct_user_like
  def create
    Like.create(user: current_user, secret: Secret.find(params[:id]))
    redirect_to :back # sends to previous url
  end

  def destroy
    Like.find_by(user: current_user, secret: Secret.find(params[:id])).destroy
    redirect_to :back
  end
end
