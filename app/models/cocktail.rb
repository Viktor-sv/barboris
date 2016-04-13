class Cocktail < ActiveRecord::Base

  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def value
    ingredients.joins(:product).where('products.product_type = ?', 'drink').sum(:value)
  end

  def price
    ingredients.all.inject(0){|price,ingredient| price + ingredient.price}
  end

end
