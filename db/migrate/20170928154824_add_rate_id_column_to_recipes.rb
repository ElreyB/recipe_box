class AddRateIdColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :rate_id, :integer)
  end
end
