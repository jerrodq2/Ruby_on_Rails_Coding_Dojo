class RostersController < ApplicationController
  def create
    User.find(session[:id]).rosters.create(event: Event.find(params[:event_id]))
    redirect_to :back
  end
  def destroy
    Roster.find_by(user: current_user, event: Event.find(params[:id])).destroy
    redirect_to :back
  end
end
