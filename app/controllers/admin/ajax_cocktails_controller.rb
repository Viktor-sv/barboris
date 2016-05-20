class Admin::AjaxCocktailsController < ApplicationController

  before_filter :find_item, only: [:edit, :update, :destroy,:show,]

  def index
    puts"index"
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end


def show
  puts"show"
end

  def update
    puts"update"
    respond_to do |format|
      if @cocktail.update_attributes item_params
        format.html{ redirect_to action: :index}
        format.json{ head :no_content}
      else
        format.html{ reder action: :edit}
        format.json{ render_to json: @cocktail.errors, status: :unprocessable_entity}
      end

    end

  end







  def item_params
    puts params
    params.require(:cocktail).permit(:id, :name, :description, :image, :visible, ingredients_attributes: [:id, :value, :product_id, :cocktail_id])

  end





  private
  def prepare_ingredient_item
    (INGREDIENT_MAX_COUNT-@cocktail.ingredients.size).times{   @cocktail.ingredients.build }
  end

  def find_item
    @cocktail = Cocktail.where(id: params[:id]).first
  end

end
