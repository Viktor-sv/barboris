class WelcomeController < ApplicationController

  def index

  end

  def show
    #@cocktails = Cocktail.all
      redirect_to action:  'index'

  end

  def search_by_product (product)
         #@cocktails = Cocktail.includes(:ingredients,:products).includes()
    @cocktails = Cocktail.all.pick(product)

    @cocktails.each do |cocktail|
      puts "gehh"
      putd cocktail.name.to_s

    end

    end

end
