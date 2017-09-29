class CreateTableRates < ActiveRecord::Migration[5.1]
  def change
    create_table(:rates) do |t|
      t.column(:number, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps
    end
  end
end
