class ShowHideCocktailOpt < ActiveRecord::Migration
  def change
    add_column :cocktails, :visible, :boolean, default: false
  end
end
