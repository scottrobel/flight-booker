class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport', foreign_key: :start_airport_id
  belongs_to :to_airport, class_name: 'Airport', foreign_key: :end_airport_id
end
