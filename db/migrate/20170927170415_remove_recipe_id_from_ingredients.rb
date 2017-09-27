class RemoveRecipeIdFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column(:ingredients, :recipe_id)
  end
end
