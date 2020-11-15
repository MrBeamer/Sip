# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database now...'
Ingredient.destroy_all
puts 'Database clean ✅'

# Ingredient.create(name: "Lemon")
# Ingredient.create(name: "Ice")
# Ingredient.create(name: "Mint Leaves")
# Ingredient.create(name: "Rhum")
# Ingredient.create(name: "Vodka")
# Ingredient.create(name: "Tequila")
# Ingredient.create(name: "Orange Juice")
# Ingredient.create(name: "Tomato Juice")

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

puts "Complete, created #{Ingredient.count} ingredients."
puts "Complete, created #{Cocktail.count} cocktails."
