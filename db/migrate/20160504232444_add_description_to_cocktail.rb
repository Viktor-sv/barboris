class AddDescriptionToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :description, :string
  end
end
