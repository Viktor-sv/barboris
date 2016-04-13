


class ProductsController < ApplicationController

  before_filter :find_item, only: [:edit, :update,:destroy,:show,]

  def index
    @products = Product.all
  end



  def new
    @product = Product.new
  end

  def create
    Product.create item_parms
    redirect_to action:'index'
  end

  def item_parms
    params.require(:product).permit(:id, :name, :cost_price,:min_value,:product_type)
  end


  def edit
    #@product = Product.where(id: params[:id]).first
  end


  def update
   # @product = Product.where(id: params[:id]).first
    @product.update_atribute item_parms
    if @product.error.empty?
      redirect_to action: 'index'
    else
      render 'edit'
    end

  end

  def show
    @products = Product.all
  end


  def destroy
    @product.destroy
    redirect_to action:  'index'
  end

  private
  def find_item
    @product = Product.where(id: params[:id]).first
  end

end
