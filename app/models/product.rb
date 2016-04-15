class Product < ActiveRecord::Base

validates :cost_price, :min_value, :product_type, presence: true
validates :name, presence: true, allow_blank: false
validates :cost_price ,:min_value, numericality: {:greater_then => 0}

has_many :ingredients
has_many :cocktail, through: :ingredients

before_save{self.name = name.titleize}


@@tax = 0.04
@@markup_percent = 0.5

 def price
   cost_price + markup +  +(markup * @@tax)
 end

   def markup
    cost_price * @@markup_percent
   end


  @@products_types = ['drink','not drink']
  def self.product_types
      @@products_types
  end

end
