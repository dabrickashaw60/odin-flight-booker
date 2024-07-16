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

airport_sfo = Airport.find_by(code: "SFO")
airport_jfk = Airport.find_by(code: "JFK")

Flight.create(departure_airport: airport_sfo, arrival_airport: airport_jfk, start_datetime: DateTime.new(2024, 8, 1, 10, 0, 0), duration: 360)