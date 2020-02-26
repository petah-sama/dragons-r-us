# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Canceling all bookings'
Booking.destroy_all

puts 'Killing all dragons with an axe 🪓🪓🪓'
Dragon.destroy_all

puts 'Breeding 15 more dragons 🥚'

7.times do
  Dragon.create(
    name: Faker::Games::ElderScrolls.name,
    category: Faker::Games::ElderScrolls.dragon,
    age: rand(100..10000),
    user_id: 2,
    price_per_day: rand(0..1000),
    difficulty: rand(1..3),
    address: 'Praça marques de pombal, Lisboa',
    available: true
  )
end

8.times do
  Dragon.create(
    name: Faker::Games::ElderScrolls.name,
    category: Faker::Games::ElderScrolls.dragon,
    age: rand(100..10000),
    user_id: 3,
    price_per_day: rand(0..1000),
    difficulty: rand(1..3),
    address: 'Campo pequeno, Lisboa',
    available: true
  )
end

puts 'Dragons are born 🐉🐉🐉'
