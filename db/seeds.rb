# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creation..."
Company.destroy_all
company1 = Company.create!(name: "The-Welcomer", address: "Le Wagon")
company2 = Company.create!(name: "Evolve", address: "Le Wagon")
company3 = Company.create!(name: "Hoops I did it again", address: "Le Wagon")

puts "..Company created"

puts "Users created"
Team.destroy_all
team1 = Team.create!(name: "les indestructibles",address: "146 rue solférino lille")
team2 = Team.create!(name: "les artistes",address: "24 rue de la clé lille")
team3 = Team.create!(name: "Avengers",address: "25 rue de la clé lille")
team4 = Team.create!(name: "ok",address: "26 rue de la clé lille")
puts "Team created"

puts "Creation Users"
User.destroy_all
user1 = User.create!(first_name: "Caroline",last_name: "Bernard", email: "caroline@gmail.com", password: "azerty", job: "Supply chain", role:"manager", company_id: company1.id, team_id: team1.id)
user2 = User.create!(first_name: "Louise",last_name: "Galliot", email: "louise@gmail.com", password: "azerty",job: "DRH", role:"hr", company_id: company1.id, team_id: team1.id)
user3 = User.create!(first_name: "Charles",last_name: "Desplechin", email: "charle@gmail.com", password: "azerty", job: "stagiaire", role:"newcomer", company_id: company1.id, team_id: team1.id)
user4 = User.create!(first_name: "Charles",last_name: "Desplechin", email: "charles@gmail.com", password: "azerty", job: "stagiaire", role:"newcomer", company_id: company1.id, team_id: team1.id)
