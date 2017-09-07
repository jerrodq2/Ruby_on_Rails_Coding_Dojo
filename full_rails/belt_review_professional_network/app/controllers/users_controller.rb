class UsersController < ApplicationController
  def index
    @users = User.where.not(id: Invitation.where(reciever:User.find(session[:id])).pluck(:sender_id)).where.not(id: Network.where(user:User.find(session[:id])).pluck(:associate_id)).where.not(id: session[:id]).where.not(id: Invitation.where(sender:User.find(session[:id])).pluck(:reciever_id))
    # this is a fancy query that basically grabs any user that doesn't have an invitaiton towards the user, doesn't have an invitaiton from the user, is not associated with/in the network of the user, and excluding the user him/herself
  end
  def create
    user = User.create(user_params)
    if user.valid?
      session[:id] = user.id
      session[:name] = user.name
      redirect_to '/professional_profile'
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_session_path
    end
  end
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :description, :email, :password, :password_confirmation)
  end
end
