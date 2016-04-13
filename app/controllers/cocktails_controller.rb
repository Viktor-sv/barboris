class CocktailsController < ApplicationController
  before_filter :find_item, only: [:edit, :update,:destroy,:show,]
  after_filter :prepare_ingredient_item , only: [:new, :edit]

  INGREDIENT_MAX_COUNT = 5

  def  new
    @cocktail = Cocktail.new
   # INGREDIENT_MAX_COUNT.times{@cocktail.ingredients.build}
  end

  def index
    @cocktails = Cocktail.all
  end


  def item_params
    params.require(:cocktail).permit (:id,:name, ingredients_attributes:[:id,:value,:product_id, :cocktail_id])

  end

  def edit
   # i_count = INGREDIENT_MAX_COUNT -@cocktail.ingredients.size
   # i_count.times{@cocktail.ingredients.build}
  end

  private

  def prepare_ingredient_item
        (INGREDIENT_MAX_COUNT-@cocktail.ingredients.size).time{
          @cocktail.ingredients.build
        }
  end

  def find_item
    @cocktail = Cocktail.where(id: params[:id]).first
  end

end
