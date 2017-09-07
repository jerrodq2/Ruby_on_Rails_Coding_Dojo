class NetworksController < ApplicationController
  def index
    @user = User.includes(:networks, :associates).find(session[:id])
    @invitations = Invitation.where(reciever: User.find(session[:id]))
  end
  def create
    user =  User.find(params[:id])
    main_user = User.find(session[:id])
    Network.create(user: main_user, associate: user)
    Network.create(user: user, associate: main_user)
    Invitation.find_by(reciever: main_user, sender: user).destroy
    redirect_to :back
  end
  def destroy
    user =  User.find(params[:id])
    main_user = User.find(session[:id])
    other_invite = Invitation.find_by(reciever:user, sender: main_user)
    if other_invite != nil
      other_invite.destroy # incase there's an invite going the other way, from me to the othe guy, we'll delete it, or duplicate network entries can be made
    end
    Invitation.find_by(reciever:main_user, sender: user).destroy
    redirect_to :back
  end
  def invite
    Invitation.create(sender:current_user, reciever: User.find(params[:id]))
    redirect_to :back
  end
end
