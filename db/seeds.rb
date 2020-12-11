require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database now...'
User.destroy_all
Ingredient.destroy_all
puts 'Database clean ✅'

user_one = User.create!(
  email: 'beamer@gmx.com',
  password: 'password'
)

user_two = User.create!(
  email: 'tom@gmx.com',
  password: 'password'
)

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

# cocktails
file = URI.open('https://images.unsplash.com/photo-1599021456807-25db0f974333?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=758&q=80')
mojito = Cocktail.create(
  name: 'Mojito',
  user_id: User.first.id
)
mojito.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1536935338788-846bb9981813?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1286&q=80')
sunrise = Cocktail.create(
  name: 'Vibrant Sunrise',
  user_id: User.first.id
)
sunrise.photo.attach(io: file, filename: 'sunrise.jpg', content_type: 'image/jpg')

file = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lemon-basil-margarita-1552664438.jpg?crop=0.430xw:1.00xh;0.422xw,0&resize=980:*')
lemon = Cocktail.create(
  name: 'Lemon Basil Margarita',
  user_id: User.second.id
)
lemon.photo.attach(io: file, filename: 'lemon.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1542849187-5ec6ea5e6a27?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1347&q=80')
fairytale = Cocktail.create(
  name: 'The Fairytale Negroni',
  user_id: User.second.id
)
fairytale.photo.attach(io: file, filename: 'fairytale.jpg', content_type: 'image/jpg')
# change
file = URI.open('https://www.acouplecooks.com/wp-content/uploads/2019/06/Gin-Fizz-112.jpg')
gin = Cocktail.create(
  name: 'Gin Fizz',
  user_id: User.first.id
)
gin.photo.attach(io: file, filename: 'gin.jpg', content_type: 'image/jpg')

file = URI.open('https://www.acouplecooks.com/wp-content/uploads/2020/03/Margarita-025.jpg')
margarita = Cocktail.create(
  name: 'Margarita',
  user_id: User.second.id
)
margarita.photo.attach(io: file, filename: 'margarita.jpg', content_type: 'image/jpg')

puts "Complete, created #{User.count} users."
puts "Complete, created #{Ingredient.count} ingredients."
puts "Complete, created #{Cocktail.count} cocktails."
