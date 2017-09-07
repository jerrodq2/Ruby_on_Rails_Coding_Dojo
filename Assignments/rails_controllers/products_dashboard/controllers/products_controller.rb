class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:category)
  end

  def show
    @product = Product.includes(:category).find(params[:id])
    @comments = Product.find(params[:id]).comments
  end

  def new
    @cats = Category.all
  end

  def edit
    @product = Product.includes(:category).find(params[:id])
    @cat = Category.all
  end

  def create
    product = Category.find(params[:category]).products.create(product_params)
    if product.errors.any?
      flash[:errors] = product.errors.full_messages
      redirect_to '/products/new'
    else
      redirect_to '/'
    end
  end

  def update
    category = Category.find(product_params[:category_id])
    if category
      product = Product.update(params[:id], product_params)
    else
      flash[:errors] = 'Category not found'
      redirect_to "/products/#{params[:id]}/edit"
    end
    if product.errors.any?
      flash[:errors] = product.errors.full_messages
      redirect_to "/products/#{params[:id]}/edit"
    else
      redirect_to '/'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/'
  end

  def comments
    @comments = Comment.all.includes(:product)
  end

  def comment_create
    Product.find(params[:id]).comments.create(comment_params)
    redirect_to "/products/#{params[:id]}"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
  end
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
