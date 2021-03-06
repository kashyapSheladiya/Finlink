# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Add 20 fake Thermostat"

20.times do |n|
  Api::V1::Thermostat.create! household_token: Faker::Lorem.characters(number: 32),
    location: Faker::Address.full_address
end
