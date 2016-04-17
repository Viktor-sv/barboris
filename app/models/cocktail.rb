class Cocktail < ActiveRecord::Base

  has_many :ingredients
  has_many :products, through: :ingredients



  before_save {self.name = name.titleize}

  validates :name, presence: true, allow_blank: false

  accepts_nested_attributes_for :ingredients,reject_if:  lambda {| attributes| attributes[:value].blank? && attributes[:product].blank? }
  validate :validate_ingredients
  validate :validate_noduplicate_ingredients

  def value
    #ingredients.joins(:product).where('products.product_type = ?', 'drink').sum(:value)

    ingredients.inject(0) { |sum, ingredient| sum + (ingredient.product.product_type == 'drink' ? ingredient.value : 0 )
    }
  end

  def price
    #ingredients.all.inject(0){|price,ingredient| price + ingredient.price}
    ingredients.inject(0) { |price, ingredient| price + (ingredient.value / ingredient.product.min_value)*ingredient.price}.ceil
  end

  def validate_noduplicate_ingredients
    original_ingred_array = ingredients.to_a
    uniq_ingred_array = ingredients_array.uniq {|ingredient| ingredient.product.id}
    errors.add(:id, "Remove duplicate ingredints") if (original_ingred_array-uniq_ingred_array).any&


  end

  def validate_ingredients
     if ingredients.select { |sel| sel.product.product_type == 'drink' }.size < 2

     #  errors.add(:value, "for cocktails '#{Cocktail.name}' must contain at list two drinkable product " )
     end
  end


  def check_cocktail_alkahol
     if ingredients.selct {|indredient| ingredient.product.product_alcoholc== 'alcoholis'}.any?
       self.cocktail_alkahol = 'Alcoholic cocktail'
     else
       self.cocktail_alkahol = 'Non-alcohlic cocktail'
     end
  end


end
