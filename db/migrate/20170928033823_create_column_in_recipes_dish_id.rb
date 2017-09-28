class CreateColumnInRecipesDishId < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :dish, :integer)
  end
end
