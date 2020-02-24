class RemoveLocationColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :dragons, :location
  end
end
