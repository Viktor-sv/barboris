class WelcomeController < ApplicationController

  def index
    @cocktails = Cocktail.includes(:ingredients,:products)
  end

  def show
    @coctailes = Coctaile.joins(:products).where(ingredients: {product_id: params[:id]}).distinct
    @product = Product.find_by id: params[:id]
  end

  def search_by_product (product)
   # @cocktails = Cocktail.joins(:products).where(ingreients: {product_id: params[:id]}).district
     redirect_to 'show'
   end

  def search_by_product (product)
    @cocktails = Cocktail.joins(:products).where(ingreients: {product_id: params[:id]}).district
  end

end
