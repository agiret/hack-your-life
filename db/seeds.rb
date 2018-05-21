# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Suppression des données existances...'
Hack.destroy_all
Category.destroy_all
User.destroy_all

p 'Créations du jeu de données...'
# Categories
p '-> Categories'
CAT = []
CATEGORIES = ["Cuisine", "Bricolage", "Ménage"]
CATEGORIES.each do |categroy|
  cat = Category.create!(name: categroy)
  CAT << cat
end

# Users
p '-> Users'
User.create!(email: "user1@user.fr", password: "azerty")
User.create!(email: "user2@user.fr", password: "azerty")

# Hacks
p '-> Hacks'
Hack.create!(link: "www.google.com", user_id: User.first.id, category_id: CAT[0].id)
Hack.create!(link: "www.lemonde.fr", user_id: User.last.id, category_id: CAT[1].id)
Hack.create!(link: "www.lewagon.com", user_id: User.first.id, category_id: CAT[0].id)

p 'Jeu de données créé !'
