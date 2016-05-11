class Admin::CocktailsController < ApplicationController
  before_filter :find_item, only: [:edit, :update,:destroy,:show,]
  after_filter :prepare_ingredient_item , only: [:new, :edit]

  INGREDIENT_MAX_COUNT = 5

  def  new
    @cocktail = Cocktail.new
   # INGREDIENT_MAX_COUNT.times{@cocktail.ingredients.build}
    prepare_ingredient_item
  end

  def index
    @cocktails = Cocktail.includes(:ingredients,:products)
  end


  def item_params
    params.require(:cocktail).permit(:id,:name,:description,:image, ingredients_attributes: [:id, :value, :product_id, :cocktail_id])

  end

  def edit
    prepare_ingredient_item
   # i_count = INGREDIENT_MAX_COUNT -@cocktail.ingredients.size
   # i_count.times{@cocktail.ingredients.build}
  end

  def create
    @cocktail = Cocktail.create item_params
    if @cocktail.errors.empty?
      flash[:succes] = "Cocktail \'#{@cocktail.name.humanize}\' was created succesfully"
      redirect_to @cocktail
    else
      flash[:warning] = @cocktail.errors.full_messages.to_sentence
      prepare_ingredient_item
      render :new
     end

  end

  def update
    @cocktail.update_attributes item_params
    if @cocktail.errors.empty?


      flash[:succes] = "Cocktail \'#{@cocktail.name.humanize}\' was updated succesfully"
      redirect_to action: :index
    else
      flash[:warning] = @cocktail.errors.full_messages.to_sentence
    render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to action:  'index'
  end

  def show
    #@cocktails = Cocktail.all
  #  redirect_to action:  'index'
  end

  private
  def prepare_ingredient_item
        (INGREDIENT_MAX_COUNT-@cocktail.ingredients.size).times{        @cocktail.ingredients.build }
  end

  def find_item
    @cocktail = Cocktail.where(id: params[:id]).first
  end

end
