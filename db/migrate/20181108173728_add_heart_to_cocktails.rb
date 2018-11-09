class AddHeartToCocktails < ActiveRecord::Migration[5.2]
  def change
  	add_column :cocktails, :heart, :integer
  end
end
