class AddCoordinatesToDragons < ActiveRecord::Migration[5.2]
  def change
    add_column :dragons, :latitude, :float
    add_column :dragons, :longitude, :float
    add_column :dragons, :address, :string
  end
end
