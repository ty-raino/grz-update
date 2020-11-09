# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.first_or_create(email: "test@test.com", password: "password", username: "testy")

g1 = Game.find_or_create_by(title: "Call of Duty: Modern Warfare")
g2 = Game.find_or_create_by(title: "Watch Dogs: Legion")
g3 = Game.find_or_create_by(title: "Overwatch")
g4 = Game.find_or_create_by(title: "Assassin's Creed Odyssey")