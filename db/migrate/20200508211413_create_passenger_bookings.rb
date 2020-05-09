class CreatePassengerBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :passenger_bookings do |t|
      t.belongs_to :passenger, null: false
      t.belongs_to :booking, null: false
      t.timestamps
    end
  end
end
