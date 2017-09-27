class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |i|
      i.column(:name, :string)
      i.column(:amount, :string)
      i.column(:recipe_id, :integer)

      i.timestamps
    end
  end
end
