class EventsController < ApplicationController
  before_action :states

  def index
    @events = Event.all.includes(:state, :user, :rosters, :attending_users)
    @new = Event.new
    @user = current_user
    # current_user is a helper method defined in application_controller.rb
  end

  def show
    @event = Event.includes(:state, :user, :rosters, :attending_users, :comments).find(params[:id])
    # Notice how I can use .includes for basically everything that is associated with this event, but it's important that you pay attention to whether each is plural or singluar, which is determined by whether the event model has: has_many, has_one, or belongs_to
    @comment =Comment.new
  end

  def create
    date = Time.new().to_date
    # I do this to make sure that the created event isn't in the past
    if event_params[:date] == '' || date > event_params[:date].to_date || date == event_params[:date].to_date
      flash[:errors] = ['You must pick a future date']
      return redirect_to :back
    end
    event = Event.create(event_params.merge({state: State.find(event_params[:state]), user: current_user}))
    # Notice how I use current_user, current_user is a helper method defined in application_controller.rb
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
    if event_params[:date] == '' || date > event_params[:date].to_date || date == event_params[:date].to_date
      flash[:errors] = ['You must pick a future date']
      return redirect_to :back
    end
    event = Event.create(event_params.merge({state: State.find(event_params[:state]), user: current_user}))
    # the above query actually creates a new event, not updates it as it should, I just leave it like it is since there's no point in changing it right now
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
