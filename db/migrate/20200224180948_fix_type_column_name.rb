class FixTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :dragons, :type, :category
  end
end
