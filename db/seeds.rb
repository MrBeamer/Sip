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

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Blood Mary")
Cocktail.create(name: "Sex on the Beach")
Cocktail.create(name: "Pina Colada")

puts "Complete, created #{User.count} users."
puts "Complete, created #{Ingredient.count} ingredients."
puts "Complete, created #{Cocktail.count} cocktails."
