class Ingredient < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :product

  validates :value, numericality: {greater_than: 0}
  validates :product_id, presence:  true, allow_blank: false
  def price

    product.nil? ? 0: (value/product.min_value)*product.price

  end
end
