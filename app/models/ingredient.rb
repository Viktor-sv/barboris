class Ingredient < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :product

  validates :value, numericality: {greater_than: 0}
  validates :product_id, presence:  true, allow_blank: false

  validate :validate_value
  def price

    product.nil? ? 0: (value/product.min_value)*product.price

  end




  def validate_value
    puts "validates"

    if  product.present?

      if product.min_value > value
        errors.add(:value, "for product '#{product.name}' must be greater than ingredient min_value" )
        puts "*******************"
      end

    end

  end
end
