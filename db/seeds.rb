# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Canceling all bookings ❌'
Booking.destroy_all

puts 'Killing all dragons with an axe 🪓'
Dragon.destroy_all

puts 'Breeding 20 more dragons 🥚'

5.times do
  Dragon.create(
    name: Faker::TvShows::GameOfThrones.unique.dragon,
    category: Faker::Games::ElderScrolls.dragon,
    age: rand(100..10000),
    user_id: 9,
    price_per_day: rand(0...1000),
    difficulty: rand(1..3),
    address: 'Oslo, Norway',
    available: true
  )
end

5.times do
  Dragon.create(
    name: Faker::TvShows::GameOfThrones.unique.dragon,
    category: Faker::Games::ElderScrolls.dragon,
    age: rand(100..10000),
    user_id: 8,
    price_per_day: rand(0...1000),
    difficulty: rand(1..3),
    address: 'Copenhagen, Denmark',
    available: true
  )
end

10.times do
  Dragon.create(
    name: Faker::Creature::Horse.unique.name,
    category: Faker::Games::ElderScrolls.dragon,
    age: rand(100..10000),
    user_id: 4,
    price_per_day: rand(0...1000),
    difficulty: rand(1..3),
    address: 'Rua do Conde de Redondo, Lisboa',
    available: true
  )
end

puts 'Dragons are born 🐉🐉🐉'
