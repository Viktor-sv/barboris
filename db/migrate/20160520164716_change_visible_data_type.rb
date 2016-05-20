class ChangeVisibleDataType < ActiveRecord::Migration
  def change

    change_column :cocktails, :visible, :string, default: "show"
  end
end
