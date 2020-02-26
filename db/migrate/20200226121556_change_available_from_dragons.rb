class ChangeAvailableFromDragons < ActiveRecord::Migration[5.2]
  def change
    change_column :dragons, :available, :boolean, default: true
  end
end
