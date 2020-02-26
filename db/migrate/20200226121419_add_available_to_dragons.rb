class AddAvailableToDragons < ActiveRecord::Migration[5.2]
  def change
    add_column :dragons, :available, :boolean
  end
end
