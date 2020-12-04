# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


puts "Creation..."
Company.destroy_all
company1 = Company.create!(name: "The-Welcomer", address: "Le Wagon")
company2 = Company.create!(name: "Evolve", address: "Le Wagon")
company3 = Company.create!(name: "Hoops I did it again", address: "Le Wagon")
file1 = URI.open('https://lntp.net/wp-content/uploads/2016/12/Tesla-logo-2003-2500x2500.png')
file2 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/6/62/Logo_LOSC_Lille_2018.svg/1200px-Logo_LOSC_Lille_2018.svg.png')
company1.logo.attach(io: file1, filename: 'logo1.png', content_type: 'image/png')
company2.logo.attach(io: file2, filename: 'logo2.png', content_type: 'image/png')
puts "..Company created"

puts "Library"
library1 = Library.create!(label: "Rule", company_id: company1.id)
file4 = URI.open('https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf')
library1.file.attach(io: file4, filename: 'pdf1.pdf', content_type: 'image/pdf' )
puts "..library created"




puts "Users created"
Team.destroy_all
puts "Team created"

puts "Creation Users"
User.destroy_all

puts "..users created"

puts "Creation Habits"
Habit.destroy_all
puts "..habits created"

puts "Creation Missions"
Mission.destroy_all

puts "..missions created"

