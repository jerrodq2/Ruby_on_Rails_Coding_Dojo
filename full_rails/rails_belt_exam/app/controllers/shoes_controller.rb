class ShoesController < ApplicationController
  def index
    @shoes = Shoe.where(status: 'For sale').includes(:user)
  end
  def create
    date = Time.new().to_date
    shoe = User.find(current_user).shoes.create(product: shoe_params[:product], amount: shoe_params[:amount], date: date)
    if !shoe.valid?
      flash[:errors] = shoe.errors.full_messages
    end
    redirect_to :back
  end
  def destroy
    Shoe.find(params[:id]).destroy
    redirect_to :back
  end
  def purchase
    date = Time.new().to_date
    buyer = current_user
    seller = User.find(params[:uid])
    shoe = Shoe.find(params[:id])
    shoe.update(status: 'Bought')
    Purchase.create(date:date, seller: seller, buyer: buyer, shoe: shoe)
    redirect_to "/dashboard/#{session[:id]}"
  end

  private
  def shoe_params
    params.require(:shoe).permit(:amount, :product)
  end
end
