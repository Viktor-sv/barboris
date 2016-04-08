class ProductsController < ApplicationController
  def index
    @products = Product.all
  end



  def new
    @product = Product.new
  end

  def create
    Product.create item_parms
    redirect_to axction:'index'
  end

  def item_parms
    params.require(:product).permit(:id, :name, :cost_price,:min_value,:product_type)
  end


end
