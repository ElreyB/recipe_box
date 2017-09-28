class RenameTableType < ActiveRecord::Migration[5.1]
  def change
    rename_table('types', 'dishes')
  end
end
