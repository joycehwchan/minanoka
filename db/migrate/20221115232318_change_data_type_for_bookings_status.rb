class ChangeDataTypeForBookingsStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :status, :integer, using: 'status::integer'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
