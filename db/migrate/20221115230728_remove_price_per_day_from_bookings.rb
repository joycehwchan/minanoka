class RemovePricePerDayFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :price_per_day
  end
end
