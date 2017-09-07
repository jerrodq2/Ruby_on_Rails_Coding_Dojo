class UsersController < ApplicationController
  def index
    @user = User.all
    # User.all grabs all the info from the User table, @user is a variable which can be accessed in the view related to this method
    puts @user
    render json: @user
  end
  def new
  end
  def create
    User.create(name:Faker::Name.first_name)
    redirect_to '/users'
  end
  def show
    @user = User.find(params[:id])
    puts params
    render json: @user
  end
  def edit
    @one = User.find(params[:id])
  end
  def total
    @all = User.all
    render json: @all.length
  end
end
