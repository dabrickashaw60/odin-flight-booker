# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.create(code: "SFO")
Airport.create(code: "JFK")
Airport.create(code: "ALB")
Airport.create(code: "LAX")

airport_sfo = Airport.find_by(code: "SFO")
airport_jfk = Airport.find_by(code: "JFK")
airport_alb = Airport.find_by(code:"ALB")
airport_lax = Airport.find_by(code: "LAX")

Flight.create(departure_airport: airport_sfo, arrival_airport: airport_jfk, start_datetime: DateTime.new(2024, 8, 1, 10, 0, 0), duration: 360)
Flight.create(departure_airport: airport_jfk, arrival_airport: airport_sfo, start_datetime: DateTime.new(2024, 8, 2, 10, 0, 0), duration: 160)
Flight.create(departure_airport: airport_alb, arrival_airport: airport_sfo, start_datetime: DateTime.new(2024, 8, 3, 10, 0, 0), duration: 460)
Flight.create(departure_airport: airport_lax, arrival_airport: airport_jfk, start_datetime: DateTime.new(2024, 8, 4, 10, 0, 0), duration: 560)
Flight.create(departure_airport: airport_alb, arrival_airport: airport_lax, start_datetime: DateTime.new(2024, 8, 5, 10, 0, 0), duration: 700)
