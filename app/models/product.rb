class Product < ActiveRecord::Base
  @@products_types = ['drink','not drink']
  def self.product_types
      @@products_types
  end

end
