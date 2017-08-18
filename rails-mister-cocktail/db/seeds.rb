# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "vodka")
Ingredient.create(name: "rum")

Cocktail.create(name: "mojito")
Cocktail.create(name: "bloody mary")
Cocktail.create(name: "margarita")
Cocktail.create(name: "piña colada")
Cocktail.create(name: "moscow mule")

Cocktail.all.each do |cocktail|
  description = [1, 2, 3, 4]
  5.times do
    Dose.create(description: description.sample, ingredient: Ingredient.all.sample, cocktail: cocktail)
  end
end
