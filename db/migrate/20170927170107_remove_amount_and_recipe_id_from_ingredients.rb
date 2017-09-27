class RemoveAmountAndRecipeIdFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column(:ingredients, :amount, :recipe_id)
  end
end
