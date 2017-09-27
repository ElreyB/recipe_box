class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |r|
      r.column(:name, :string)
      r.column(:instructions, :string)
      r.column(:rating, :integer)
      r.column(:ingredient_id, :integer)
      r.column(:type_id, :integer)

      r.timestamps
    end
  end
end
