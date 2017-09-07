class UsersController < ApplicationController
  def index
    @user = User.all
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
