class UsersController < ApplicationController
  before_action :states

  def create
    # how the strong params come in: {"first_name"=>"Louie", "last_name"=>"Bazdeg", "state"=>"23", "city"=>"Washington D.C.", "email"=>"louie@b.com", "password"=>"dddddddd", "password_confirmation"=>"dddddddd"}
    user = User.create(user_params.merge({state: State.find(user_params[:state])}))
    # Notice how I use .merge with the strong params. This is because, if I tried to create the user with just the strong param, then it would be referencing the state by foreign key or with its id, which you should never do. So, I grab the entire instance of that state, with State.find(), which turns the strong param into what you see below. Notice that this instance is named "state" just like the one in the strong param as well, so with .merge, it overwrites it so that there is no conflict. The State instance begins and ends with carot marks <instance data>
    #{"first_name"=>"Louie", "last_name"=>"Bazdeg", "state"=>#<State id: 23, state: "MN", created_at: "2016-12-14 17:38:12", updated_at: "2016-12-14 17:38:12">, "city"=>"Washington D.C.", "email"=>"louie@bb.com", "password"=>"dddddd", "password_confirmation"=>"dddddd"}

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
