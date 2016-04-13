class Ingredient < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :product


  def price

    product.nil? ? 0: (value/product.min_value)*product.price

  end
end
