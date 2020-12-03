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
file3 = URI.open('https://e7.pngegg.com/pngimages/727/1005/png-clipart-apple-logo-business-apple-heart-computer.png')
company1.logo.attach(io: file1, filename: 'logo1.png', content_type: 'image/png')
company2.logo.attach(io: file2, filename: 'logo2.png', content_type: 'image/png')
company3.logo.attach(io: file3, filename: 'logo3.png', content_type: 'image/png')
puts "..Company created"

puts "Library"
library1 = Library.create!(label: "Rule", company_id: company1.id)
file4 = URI.open('https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf')
library1.file.attach(io: file4, filename: 'pdf1.pdf', content_type: 'image/pdf' )
puts "..library created"




puts "Users created"
Team.destroy_all
team1 = Team.create!(name: "les indestructibles",address: "146 rue solférino lille")
team2 = Team.create!(name: "les artistes",address: "24 rue de la clé lille")
team3 = Team.create!(name: "Avengers",address: "25 rue de la clé lille")
team4 = Team.create!(name: "ok",address: "26 rue de la clé lille")
puts "Team created"

puts "Creation Users"
User.destroy_all

user1 = User.create!(first_name: "Caroline",last_name: "Bernard", email: "caroline@gmail.com", password: "azerty", job: "Supply chain", role:"Manager", company_id: company1.id, team_id: team1.id)
user2 = User.create!(first_name: "Louise",last_name: "Galliot", email: "louise@gmail.com", password: "azerty",job: "DRH", role:"RH", company_id: company1.id, team_id: team3.id)
user3 = User.create!(first_name: "Charles",last_name: "Desplechin", email: "charle@gmail.com", password: "azerty", job: "stagiaire", role:"Newcomer", company_id: company1.id, team_id: team1.id)
user4 = User.create!(first_name: "Jean",last_name: "Rooney", email: "jean@gmail.com", password: "azerty", job: "Supply chain", role:"Manager", company_id: company1.id, team_id: team2.id)
user5 = User.create!(first_name: "Pierre",last_name: "Xavi", email: "pierre@gmail.com", password: "azerty",job: "DRH", role:"RH", company_id: company1.id, team_id: team3.id)
user6 = User.create!(first_name: "Ousmane",last_name: "Dembélé", email: "ousmane@gmail.com", password: "azerty", job: "stagiaire", role:"Newcomer", company_id: company1.id, team_id: team2.id)
user7 = User.create!(first_name: "Tim",last_name: "Mate", email: "tim@gmail.com", password: "azerty",job: "Developpeur", role:"Teammate", company_id: company1.id, team_id: team1.id)
user8 = User.create!(first_name: "Chloé",last_name: "Quipuier", email: "chloé@gmail.com", password: "azerty", job: "Product Owner", role:"Teammate", company_id: company1.id, team_id: team2.id)
file5 = URI.open('https://ofad.org/files/daily-photo/recent-and-random-portraits_8.jpg')
file6 = URI.open('https://www.slate.fr/sites/default/files/styles/1200x680/public/reine-elizabeth-ii_0.jpg')
file7 = URI.open('https://www.practicaespanol.com/wp-content/uploads/Alt-Fotograf%C3%ADa-de-Arthur-Sasse-de-la-instant%C3%A1nea-de-Albert-Einstein-EFE.jpg')
user2.photo.attach(io: file5, filename: 'logo5.jpg', content_type: 'image/jpg')
user1.photo.attach(io: file6, filename: 'logo6.jpg', content_type: 'image/jpg')
user3.photo.attach(io: file7, filename: 'logo7.jpg', content_type: 'image/jpg')
puts "..users created"

puts "Creation Habits"
Habit.destroy_all
habit1 = Habit.create!(name: "Don't forget your pass every morning", user_id: user3.id)
habit2 = Habit.create!(name: "On tuesday, your turn to bring coffee", user_id: user3.id)
habit3 = Habit.create!(name:"Never mail someone out the company without checking the adress", user_id: user3.id)
habit4 = Habit.create!(name: "Please warn everyone when you are on holiday", user_id: user3.id)
habit5 = Habit.create!(name: "Home-office available on thursday and friday !", user_id: user3.id)
puts "..habits created"

puts "Creation Missions"
Mission.destroy_all
mission1 = Mission.create!(name: "Prepare the technical reunions", description:'this the missions description', user_id: user3.id)
mission2 = Mission.create!(name:"Assist your coworkers", description: 'this the missions description', user_id: user3.id)
mission3 = Mission.create!(name: "Watch for new tendances", description: 'this the missions description', user_id: user3.id)
mission4 = Mission.create!(name:"Build commercial proposals", description: 'this the missions description', user_id: user3.id)
mission5 = Mission.create!(name: "Invent water", description: 'this the missions description', user_id: user3.id)
puts "..missions created"

