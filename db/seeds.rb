# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flight.delete_all
Airport.delete_all
AirportCodes = ["PA",
"KS",
"AK",
"AL",
"AR",
"OK",
"AZ",
"CA",
"CO",
"FL",
"GA",
"HI",
"ID",
"IN",
"IL",
"KY",
"LA",
"MD",
"MI",
"MN",
"MO",
"MT",
"NJ",
"NC",
"NY",
"OH",
"OR",
"SC",
"SD",
"TX",
"TN",
"UT",
"VA",
"WA",
"WI",
"WV",
"WY",
"CT",
"IA",
"MA",
"ME",
"NE",
"NH",
"NM",
"NV",
"MS",
"ND",
"VT",
"RI",
"DC",
"DE"]


def random_flight_duration
  60 * 60 * rand(10)
end

def random_flight_start_time
  flight_epoch = Time.now.to_i + rand(60 * 60 * 24 * 50)
  Time.at(flight_epoch)
end
//

airports_attributes = AirportCodes.map do |location|
  {location_code: location}
end

Airport.create!(airports_attributes)

airport_ids = Airport.pluck(:id)
flight_attributes = []
airport_ids.each do |from_airport_id|
  airport_ids.each do |to_airport_id|
    unless from_airport_id == to_airport_id
      flight_hash = 
      {
        start_airport_id: from_airport_id,
        end_airport_id: to_airport_id,
        flight_start_time: random_flight_start_time,
        flight_duration: random_flight_duration
      }
      flight_attributes << flight_hash
    end
  end
end

Flight.create!(flight_attributes)
