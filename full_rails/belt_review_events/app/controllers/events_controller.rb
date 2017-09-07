class EventsController < ApplicationController
  before_action :states
  def index
    @events = Event.all.includes(:state, :user, :rosters, :attending_users)
    @new = Event.new
    @user = current_user
  end
  def show
    @event = Event.includes(:state, :user, :rosters, :attending_users, :comments).find(params[:id])
    @comment =Comment.new
  end
  def create
    date = Time.new().to_date
    if event_params[:date] == '' ||date > event_params[:date].to_date || date == event_params[:date].to_date
      flash[:errors] = ['You must pick a future date']
      return redirect_to :back
    end
    event = Event.create(event_params.merge({state: State.find(event_params[:state]), user: current_user}))
    if !event.valid?
      flash[:errors] = event.errors.full_messages
    end
    redirect_to :back
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    date = Time.new().to_date
    if event_params[:date] == '' ||date > event_params[:date].to_date || date == event_params[:date].to_date
      flash[:errors] = ['You must pick a future date']
      return redirect_to :back
    end
    event = Event.create(event_params.merge({state: State.find(event_params[:state]), user: current_user}))
    if !event.valid?
      flash[:errors] = event.errors.full_messages
      return redirect_to :back
    end
    redirect_to '/events'
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def event_params
    params.require(:event).permit(:name, :city, :state, :date, :user)
  end
end
