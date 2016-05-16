class WelcomeController < ApplicationController

  def index
    @cocktails = Cocktail.includes(:ingredients,:products)
  end

  def show
   # @cocktails = Cocktail.joins(:products).where(product:{whereproduct: [:id]).distinct;
  end

  def search_by_product (product)
      @cocktails = Cocktail.joins(:products).where(ingreients: {product_id: params[:id]}).district
  end

end
