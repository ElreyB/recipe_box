class RenameColumnDishInRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_column(:recipes, :dish, :dish_id)
  end
end
