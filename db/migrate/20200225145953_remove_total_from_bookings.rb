class RemoveTotalFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :total, :integer
  end
end
