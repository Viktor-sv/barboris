class Cocktail < ActiveRecord::Base

  has_many :ingredients
  has_many :products, through: :ingredients



  before_save {self.name = name.titleize}

  validates :name, presence: true, allow_blank: false

  accepts_nested_attributes_for :ingredients,reject_if:  lambda {| attributes| attributes[:value].blank? && attributes[:product].blank? }
  validate :validate_ingredients

  def value
    #ingredients.joins(:product).where('products.product_type = ?', 'drink').sum(:value)

    ingredients.inject(0) { |sum, ingredient| sum + (ingredient.product.product_type == 'drink' ? ingredient.value : 0 )
    }
  end

  def price
    #ingredients.all.inject(0){|price,ingredient| price + ingredient.price}
    ingredients.inject(0) { |price, ingredient| price + (ingredient.value / ingredient.product.min_value)*ingredient.price}.ceil
  end

  def validate_ingredients
     if ingredients.select { |sel| sel.product.product_type == 'drink' }.size < 2

     #  errors.add(:value, "for cocktails '#{Cocktail.name}' must contain at list two drinkable product " )
     end


    end


end
