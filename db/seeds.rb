# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Destroy all reviews..."
Review.destroy_all
puts "Destroy all products..."
Product.destroy_all
puts "Destroy all farms..."
Farm.destroy_all
puts "Destroy all users..."
User.destroy_all

puts 'Create users...'
cities = %w[marseille, aubagne cassis lascours allauch napollon auriol peypin ceyreste cadolive]
categories = %w[fruits fleurs fromage viandes poissons légumes]
products = ['poires williams', 'poires packham', 'poires conférence', 'poires passe-crassane',
            'pommes braeburn', 'pommes granny', 'pommes golden', 'pommes jonagold', 'pommes reinettes',
            'pommes fujis']
contentProducts = ["La poire Williams est une variété ancienne encore très cultivée aujourd'hui puisqu'elle est
                    la poire la plus cultivée dans le monde. C'est un fruit d'été, originaire du
                    Royaume Uni, facile de culture. On l'aime pour sa chair juteuse et
                    très parfumée qui s'apprécie crue mais aussi cuite dans de nombreuses recettes sucrées ou salées.",
                   "Elle se conserve quelques jours à température ambiante.
                    Pour une conservation plus longue, n’hésitez pas à la placer au réfrigérateur.
                    Elle est saura vous régaler aussi bien crue que cuite. N’hésitez pas à la déguster pochée au vin !",
                   "Elle se nomme poire Conférence, mais une seule voix se fait entendre. Car tous, cultivateurs
                    comme consommateurs, l'aiment. Baptisée ainsi en 1895,
                    la poire Conférence remporte le premier prix de la conférence internationale de la poire à Londres.
                     Dès lors elle devient incontournable, surtout en France où elle est cultivée essentiellement dans le nord
                    et dans les Alpes. Concernant la saison de la poire Conférence, il faut attendre l’automne pour la récolter.
                    Autre avantage de cette variété centenaire : sa longue durée de conservation.
                    Zoom sur la success story de la poire Conférence."
                    ]
prices = [0.99, 1.29, 1.19, 1.79, 0.99, 1.49, 1.09, 1.79, 0.99, 1.09]
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
  puts "Create #{i + 1} user..."
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
    #content: Faker::Lorem::paragraph,
    name: Faker::Ancient.hero,
    photo1: "Producteurs/#{i + 1}/1.jpg",
    photo2: "Producteurs/#{i + 1}/2.jpg",
    photo3: "Producteurs/#{i + 1}/3.jpg",
    photo_owner: "Producteurs/#{i + 1}/0#{i + 1}.png"
  )
  farm.tag_list.add('fruits', parse: true)
  farm.save
  farms << farm
  puts "farm #{i + 1} create"
  puts "Creating products for farm #{farm.name}"
  10.times do |i|
    product = Product.create!(
         price: prices[i],
         name: products[i],
         units: 'kg',
         farm: farm,
         content: contentProducts.sample
       )
    product.photo = "Fruits/#{product.name}.jpg"
    product.save
  end
end
puts "create farms OK"



50.times do |i|
  user = User.create!(
    first_name: Faker::Name::first_name,
    last_name: Faker::Name::last_name,
    email: Faker::Internet::email,
    address: cities[i],
    password: 'azerty'
  )
  puts "#{i + 1} - #{user.first_name} as been created..."

  puts "Create #{i + 1} user... for rating"
  review = Review.create!(
    rating: rand(3..5),
    content: Faker::Lorem::paragraph,
    user: user,
    farm: farms.sample
  )
  puts " #{i + 1 } -#{user.first_name}, rating for : #{review.farm.name}, with #{review.rating}"
end




puts "End of seeds..."
