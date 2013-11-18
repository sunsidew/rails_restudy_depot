# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create([{ title: 'viblia note', description: %{all 3 books}, image_url: 'viblia.jpg', price: 12.00}, 
				{ title: 'toeic 1000', description: %{recent toeic quiz perfectly collected- seed code update please}, image_url: 'toeic.jpg', price: 20.00}])