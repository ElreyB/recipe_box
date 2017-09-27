class DropIngredientIdInRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column(:recipes, :ingredient_id)
  end
end
