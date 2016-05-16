class Admin::AjaxProductsController < ApplicationController

  before_filter :find_item, only: [:edit, :update,:destroy,:show,]



  def index
    @products = Product.all
    @product = Product.new
  end


  def show

    respond_to do |format|
      if @product
        format.html{redirect_to admin_ajax_product_path(@product)}
        format.js
        format.json{render_to json: @product, status: :ok, location: @product}
      else
        format.html {redirect_to admin_ajax_product_path(@product)}
        format.json{render_to json: @product.errors, status: :unprocessable_entity}
      end
    end

  end

  def update
    respond_to do |format|
    if @product
      format.html {redirect_to admin_ajax_product_path(@product), notice: 'Product'}
      format.json{ head :no_content}
      else
        format.html {reder acvtion: :edit}
        format.json{render_to json: @product.errors, status: :unprocessable_entity}
    end

    end

  end

def destroy

  @product.destroy

  respond_to do |format|
    if @product.errors.empty?
      format.html {redirect_to @product, notice: "Product was saccessfully removed"}
      format.js {}
      format.json{render_to json: @product, status: :ok, location: @product}
    else
      format.html {render action: :index}
      format.json{render_to json: @product.errors, status: :unprocessable_entity}
    end

  end

end


  def item_parms
    params.require(:product).permit(:id, :name, :cost_price,:min_value,:product_type, :image)
  end

  private
  def find_item
    @product = Product.where(id: params[:id]).first
  end

end
