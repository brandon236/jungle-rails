class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def index
    @products = Product.order(id: :desc).all
  end
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def new
    @product = Product.new
  end
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
