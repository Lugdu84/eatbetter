# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Destroy all products..."
Product.destroy_all
puts "Destroy all farms..."
Farm.destroy_all
puts "Destroy all users..."
User.destroy_all

puts 'Create users...'
cities = %w[marseille, aubagne cassis lascours allauch napollon auriol peypin ceyreste cadolive]
categories = %w[fruits fleurs fromage viandes poissons légumes]
users = []
farms = []
10.times do |i|
  user = User.create!(
    first_name: Faker::Name::first_name,
    last_name: Faker::Name::last_name,
    email: Faker::Internet::email,
    address: cities[i],
    password: 'azerty'
    )
  puts "Create #{i} user..."
  users << user
end
puts "#{users.count} users as been creating..."
puts 'Finish to create users...'


puts "Creating farms..."

10.times do |i|
  farm = Farm.create!(
    user: users[i],
    address: cities[i],
    #category: categories.sample,
    tel: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    content: Faker::Lorem::paragraph,
    name: Faker::Ancient.hero,
    photo1: "Producteurs/#{i + 1}/1.jpg",
    photo2: "Producteurs/#{i + 1}/2.jpg",
    photo3: "Producteurs/#{i + 1}/3.jpg",
    photo_owner: "Producteurs/#{i + 1}/0#{i + 1}.png"
  )
  farm.tag_list.add(categories.sample, parse: true)
  farm.save
  farms << farm
  puts "farm #{i} create"
end
puts "create farms OK"


=begin
20.times do |i|
  Product.create!(
    price: 1,
    name: 'tomate',
    units: 'kg',
    farm: Farm.first
  )
end
=end

puts "End of seed..."
