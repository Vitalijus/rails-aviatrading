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
	([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(12).join
end

10.times do
	email = "vitalij.desuk@gmail.com" << newram 
	user = User.create!(email: "#{email}", password: 'topsecret', password_confirmation: 'topsecret')
end

#20000.times do
#	Advert.create!(title: "1")
#end