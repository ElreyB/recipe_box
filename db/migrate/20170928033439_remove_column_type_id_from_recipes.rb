class RemoveColumnTypeIdFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column(:recipes, :type_id)
  end
end
