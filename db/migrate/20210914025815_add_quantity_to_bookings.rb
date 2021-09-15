class AddQuantityToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :quantity, :integer
  end
end
