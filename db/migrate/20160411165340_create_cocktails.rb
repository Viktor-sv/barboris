class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :cocktail_alcohol
      t.timestamps null: false
      t.string :cocktail_alcohol
    end
  end
end
