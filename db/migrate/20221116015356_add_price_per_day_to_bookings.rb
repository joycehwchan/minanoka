class AddPricePerDayToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :price_per_day, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
