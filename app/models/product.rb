class Product < ActiveRecord::Base

validates :name, :cost_price, :min_value, :product_type, presence: true

validates :cost_price ,:min_value, numericality: {:greater_then => 0}

has_many :ingredients
@@tax = 0.04
@@markup_percent = 0.5

 def cost_price
   cost_price + mark + + (markup * @@tax)
 end

   def murkup
    cost_price * @@markup_percent
   end


  @@products_types = ['drink','not drink']
  def self.product_types
      @@products_types
  end

end
