# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Destroy Order and order_items"
OrderItem.destroy_all
Order.destroy_all
puts "Destroy all favorites..."
Favorite.destroy_all
puts "Destroy all reviews..."
Review.destroy_all
puts "Destroy all products..."
Product.destroy_all
puts "Destroy all Openings times..."
Opening.destroy_all
puts 'Destroy all address...'
Market.destroy_all
puts "Destroy all farms..."
Farm.destroy_all
puts "Destroy all users..."
User.destroy_all

puts 'Create users...'
cities = %w[marseille aubagne cassis lascours allauch napollon auriol peypin ceyreste cadolive]
first_names =%w[Roger Norbert Xavier Aurélie Pierre Laurent Richard Emmanuelle Loïc Louis]
last_names = %w[Teradon Cotillon Lafoix Dilors Cohors Teliesse Vuque Yelle Sellier Martin]
contents = ["ma famille cultive de magnifiques fruits, depuis plusieurs générations.",
            "je cultive des pommes et des poires, avec amour.",
            "je cultive des fruits et je suis passionné par mon métier.",
            "je cultive des fruits, en respectant l'environnement.",
            "je cultive des poires et des pommes, et je serait heureux de vous les présenter !",
            "je cultive de magnifiques fruits, il ne tient qu'à vous de les découvrir.",
            "j'aimerais vous présenter l'endroit où l'excerce ma passion.",
            "je suis passioné par mon métier, et j'adorerais vous présenter les fruits que je cultive.",
            "les fruits que je cultive n'attendent que vous !",
            "je voudrais vous montrer les poires et les pommes que je cultive."
]
farms = []
users = []
addressFarm = []
days = %w[lundi mercredi dimanche]

10.times do |i|
  user = User.create!(
    first_name: first_names[i],
    last_name: last_names[i],
    email: "#{first_names[i]}.#{last_names[i]}@gmail.com",
    address: cities[i],
    password: 'azerty'
  )
  puts "Create #{i + 1} user #{first_names[i]}..."
  users << user
end
puts "#{users.count} users as been creating..."
puts 'Finish to create users...'


puts "Creating farms..."

10.times do |i|
  farm = Farm.create!(
    user: users[i],
    address: cities[i],
    tel: '06-43-76-36-78',
    email: "#{first_names[i]}.#{last_names[i]}@gmail.com",
    content: "je m'appelle #{first_names[i]} et #{contents[i]}",
    name: last_names[i],
    photo1: "Producteurs/#{i + 1}/1.jpg",
    photo2: "Producteurs/#{i + 1}/2.jpg",
    photo3: "Producteurs/#{i + 1}/3.jpg",
    photo_owner: "Producteurs/#{i + 1}/0#{i + 1}.png"
  )
  farm.tag_list.add('fruits', parse: true)
  farm.save
  3.times do |j|
    city = cities.sample
    address = Market.create!(
      name: "marché de #{city}",
      address: city,
      farm: farm,
    )
    addressFarm << address
    1.times do |index|
      opening = Opening.create!(
        start: '8 heures',
        end: '12 heures',
        day: days[j],
        market: address
      )
    end
  end


  farms << farm
  puts "farm #{i + 1} create"
  puts "Creating products for farm #{farm.name}"
  product1 = Product.create!(
    price: 0.99,
    name: 'poires williams',
    units: 'kg',
    farm: farm,
    content: "La poire Williams est une variété ancienne encore très cultivée aujourd'hui puisqu'elle est
            la poire la plus cultivée dans le monde. C'est un fruit d'été, originaire du
            Royaume Uni, facile de culture. On l'aime pour sa chair juteuse et
            très parfumée qui s'apprécie crue mais aussi cuite dans de nombreuses recettes sucrées ou salées.",
  )
  product1.photo = "Fruits/#{product1.name}.jpg"
  product1.save
  product2 = Product.create!(
    price: 1.09,
    name: 'poires packham',
    units: 'kg',
    farm: farm,
    content: "Elle se conserve quelques jours à température ambiante.
              Pour une conservation plus longue, n’hésitez pas à la placer au réfrigérateur.
              Elle est saura vous régaler aussi bien crue que cuite. N’hésitez pas à la déguster pochée au vin !",
    )
  product2.photo = "Fruits/#{product2.name}.jpg"
  product2.save
  product3 = Product.create!(
    price: 1.19,
    name: 'poires conférence',
    units: 'kg',
    farm: farm,
    content: "Elle se nomme poire Conférence, mais une seule voix se fait entendre. Car tous, cultivateurs
             comme consommateurs, l'aiment. Baptisée ainsi en 1895,
             la poire Conférence remporte le premier prix de la conférence internationale de la poire à Londres.
             Dès lors elle devient incontournable, surtout en France où elle est cultivée essentiellement dans le nord
             et dans les Alpes. Concernant la saison de la poire Conférence, il faut attendre l’automne pour la récolter.
             Autre avantage de cette variété centenaire : sa longue durée de conservation."

    )
  product3.photo = "Fruits/#{product3.name}.jpg"
  product3.save
  product4 = Product.create!(
    price: 1.39,
    name: 'poires passe-crassane',
    units: 'kg',
    farm: farm,
    content: "La poire Passe-Crassane est une variété d'hiver issue d'un croisement avec le coing.
              C'est une poire arrondie d'assez grosse taille dont la peau est jaune marbrée.
              Sa chair acidulée est très juteuse et légèrement granuleuse."
  )
  product4.photo = "Fruits/#{product4.name}.jpg"
  product4.save
  product5 = Product.create!(
    price: 1.09,
    name: 'pommes braeburn',
    units: 'kg',
    farm: farm,
    content: "La pomme Braeburn se conserve à l’abri de la lumière,
            dans un endroit frais où la température est constante. A consommer,
            elle est aussi bien bonne à croquer que cuisinée en tarte ou au four."
  )
  product5.photo = "Fruits/#{product5.name}.jpg"
  product5.save
  product6 = Product.create!(
    price: 1.09,
    name: 'pommes granny',
    units: 'kg',
    farm: farm,
    content: "Les Granny Smith sont des pommes de calibre moyen, récoltées
            avant la pleine maturité quand elles sont encore de couleur « vert pomme ».
            Certaines ayant bénéficié d'un temps de maturation plus long, ont des reflets roses."
  )
  product6.photo = "Fruits/#{product6.name}.jpg"
  product6.save
  product7 = Product.create!(
    price: 0.99,
    name: 'pommes golden',
    units: 'kg',
    farm: farm,
    content: "La pomme Golden, ou Golden Delicious, est une pomme à couteau connue dans le monde entier.
           C'est également la variété de pomme la plus cultivée en France. De culture facile,
           elle n'est cependant pas bien adaptée aux régions chaudes."
  )
  product7.photo = "Fruits/#{product7.name}.jpg"
  product7.save
  product8 = Product.create!(
    price: 1.29,
    name: 'pommes jonagold',
    units: 'kg',
    farm: farm,
    content: "La pomme Jonagold est une variété de pomme gourmande, très sucrée,
          qui se consomme aussi bien crue que cuite, dans différentes préparations culinaires.
          Sa belle robe rouge orangé, sensible à la chaleur, préfère les climats frais,
          loin du soleil brûlant du sud de la France."
  )
  product8.photo = "Fruits/#{product8.name}.jpg"
  product8.save
  product9 = Product.create!(
    price: 1.19,
    name: 'pommes reinettes',
    units: 'kg',
    farm: farm,
    content: "Qui ne connaît pas la pomme Reinette ! En plus d'être à l'origine d'une célèbre
          comptine avec la pomme d'Api, la pomme de Reinette a inspiré de nombreux pomologues.
          En effet, ce nom a été donné à plus de 150 variétés de pommes diverses et variées."
  )
  product9.photo = "Fruits/#{product9.name}.jpg"
  product9.save
  product10 = Product.create!(
    price: 1.29,
    name: 'pommes fujis',
    units: 'kg',
    farm: farm,
    content: "Elle se conserve très bien dans le bac à légumes du réfrigérateur.
            Elle se consomme aussi bien à croquer qu’en pâtisserie ou en salade.
            Elle a une chair tendre et fine et un goût sucré.
             Cette pomme juteuse et très appréciée des mangeurs de pommes car elle est douce et rafraîchissante."
  )
  product10.photo = "Fruits/#{product10.name}.jpg"
  product10.save
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
    rating: rand(4..5),
    content: 'Super producteur !',
    user: user,
    farm: farms.sample
  )
  puts " #{i + 1 } -#{user.first_name}, rating for : #{review.farm.name}, with #{review.rating}"
end

puts "Create user demo day"
user_demo = User.create!(
  first_name: 'Camille',
  last_name: 'DemoTest',
  email: 'camille@gmail.com',
  address: 'Aubagne',
  password: 'azerty'
)

puts "Create favorite farms"
  favorite1 = Favorite.create!(
    user: User.last,
    farm: Farm.first
    )
    puts "create favorites between #{Farm.first.name} and #{User.last.first_name}"
  favorite2 = Favorite.create!(
    user: User.last,
    farm: Farm.last
    )
    puts "create favorites between #{Farm.last.name} and #{User.last.first_name}"
puts "Create Order..."
order = Order.create!(
  user: User.last
)
puts "End of seeds..."
