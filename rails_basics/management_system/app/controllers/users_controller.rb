class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    puts "user params" + "*" * 100
    puts user_params
    puts "all params "+"*"*100
    puts params
    user = User.create(user_params)
    # See the below notes for the user_params, it's a strong params that uses the @user from the edit or new.html form
    if user.valid?
      redirect_to users_path
      # .valid is used to check if we can actually create a new row in the db based on the data from the form
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
      # new_user_path is automatically assigned by the resources from the routes.rb page (config folder), this sends us to the new method, or back to the new page
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.update(params[:id], user_params)
    if user.valid?
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path(params[:id])
    end
  end

  private

  # This is an example of a strong paramter or action controlled parameter, this is used to control what is sent in from the forms, so users can't tamper with the db. All information that is sent over with the form data is sent in as an associative array, and users is one of the keys since it was sent over with the form.

  # In this example, the user_params is created and requires the 'user' key, which was sent over by the form in either the new or edit view form. And since user itself is an associative array, we chain the .permit after the .require, which basically tells the strong params what to let through. So if they changed the page and added a field for 'middle name' it would be ignored since it's not in the strong param's permit or require section
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
    
    # Basically, it works like this, we require the 'user' key, so this throws out an error if we don't get that, which we are given from the form. Next, we chain the .permit, after that .require, so after requiring the 'user' key from the associative array format that the data is sent over in, we permit/allow or choose which keys will be sent through, anything not in the permit section will just be ignored and lost.
  end
end
