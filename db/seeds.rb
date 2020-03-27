# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Erasing previous users..."
sleep 2
User.destroy_all

puts "Creating new Users..."
sleep 2
User.create!([
	{ email: 'jaspb', password: 'hey', password_confirmation: 'hey' }])

@Users = User.all
puts User.all
puts "Done thanks!"

puts "Erasing previous recipes..."
sleep 2
Recipe.destroy_all

puts "Creating new recipes..."
sleep 2
Recipe.create!([
	{ user_id: 1, name: 'Thai green curry', image: 'https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2018/Vegetarian_Thai_Green_Curry_Recipe-2-2_1600.jpg' },
	{ user_id: 1, name: 'Homemade pizza', image: 'https://afarmgirlskitchen.com/wp-content/uploads/2019/07/Pizza-homemade-681x1024.jpg'}
])

@recipes = Recipe.all
puts Recipe.all
puts "Done thanks!"