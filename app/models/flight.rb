class Flight < ApplicationRecord
  
  #== Associations
  
  belongs_to :from_airport, class_name: 'Airport', foreign_key: :start_airport_id
  belongs_to :to_airport, class_name: 'Airport', foreign_key: :end_airport_id
  has_many :bookings



  ##== instance functions

  def landing_time
    flight_start_time + flight_duration
  end

  def flight_duration
    ActiveSupport::Duration.build(super)
  end

  def flight_duration=(duration)
    super(duration.to_i)
  end
end
