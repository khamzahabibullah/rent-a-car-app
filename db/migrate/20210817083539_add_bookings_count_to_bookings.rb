class AddBookingsCountToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :bookings_count, :integer, default: 0
  end
end
