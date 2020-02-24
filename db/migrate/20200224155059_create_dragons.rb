class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    create_table :dragons do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.reference :booking
      t.integer :price_per_day
      t.integer :difficulty
      t.string :location

      t.timestamps
    end
  end
end
