class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :flight_id, index: true
      t.timestamps
    end
  end
end
