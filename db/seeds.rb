# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Plan.create!(name: "Free", price: 0)
#Plan.create!(name: "Premium", price: 49.99)

def newram
	Random.rand(0...1000000)
end

100.times do
	email = "vitalij.desuk@gmail.com" << newram
	user = User.create!(email: "#{email}", password: 'topsecret', password_confirmation: 'topsecret')
end

1000.times do
	Advert.create!(title: "1")
end