class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.valid?
      session[:id] = user.id
      session[:name] = user.first_name
      redirect_to "/dashboard/#{user.id}"
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_session_path
    end
  end
  def show
    @user = User.find(params[:id])
    @shoes = Shoe.where(user: current_user, status: 'For sale')
    @sells = Purchase.where(seller:current_user).includes(:shoe, :buyer)
    @sell_total = @sells.calculate(:sum, :amount)
    @buys = Purchase.where(buyer:current_user).includes(:shoe, :seller)
    @shoe = Shoe.new
    @buy_total = @buys.calculate(:sum, :amount)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
