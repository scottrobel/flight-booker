class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :start_airport_id, index: true
      t.integer :end_airport_id, index: true
      t.datetime :flight_start_time
      t.integer :flight_duration
      t.timestamps
    end
  end
end
