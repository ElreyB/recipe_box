class CreateIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients_recipes) do |ir|
      ir.column(:ingredient_id, :integer)
      ir.column(:recipe_id, :integer)

      ir.timestamps
    end
  end
end
