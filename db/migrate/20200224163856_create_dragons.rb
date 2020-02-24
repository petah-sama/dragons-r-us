class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    create_table :dragons do |t|
      t.string :name,           null: false
      t.string :type,           null: false
      t.integer :age,           null: false
      t.references :user,       foreign_key: true
      t.integer :price_per_day, null: false
      t.integer :difficulty,    null: false
      t.string :location,       null: false

      t.timestamps
    end
  end
end
