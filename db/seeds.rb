# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flight.delete_all
Airport.delete_all
AirportCodes = ["US-PA",
"US-KS",
"US-AK",
"US-AL",
"US-AR",
"US-OK",
"US-AZ",
"US-CA",
"US-CO",
"US-FL",
"US-GA",
"US-HI",
"US-ID",
"US-IN",
"US-IL",
"US-KY",
"US-LA",
"US-MD",
"US-MI",
"US-MN",
"US-MO",
"US-MT",
"US-NJ",
"US-NC",
"US-NY",
"US-OH",
"US-OR",
"US-SC",
"US-SD",
"US-TX",
"US-TN",
"US-UT",
"US-VA",
"US-WA",
"US-WI",
"US-WV",
"US-WY",
"US-CT",
"US-IA",
"US-MA",
"US-ME",
"US-NE",
"US-NH",
"US-NM",
"US-NV",
"US-MS",
"PR-U-A",
"MH-UTI",
"US-ND",
"US-VT",
"US-RI",
"US-DC",
"US-DE"]

def random_flight_duration
  60 * 60 * rand(10)
end

def random_flight_start_time
  flight_epoch = Time.now.to_i + rand(60 * 60 * 24 * 50)
  Time.at(flight_epoch)
end

airports_attributes = AirportCodes.map do |location|
  {location_code: location}
end

Airport.create!(airports_attributes)

airport_ids = Airport.pluck(:id)
flight_attributes = []
airport_ids.each do |from_airport_id|
  airport_ids.each do |to_airport_id|
    unless from_airport_id == to_airport_id
      flight_attributes << {start_airport_id: from_airport_id,
       end_airport_id: to_airport_id,
        flight_start_time: random_flight_start_time,
        flight_duration: random_flight_duration}
    end
  end
end

Flight.create!(flight_attributes)
