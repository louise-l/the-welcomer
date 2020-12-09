require "open-uri"

puts "Destroying everything .."
Company.destroy_all
Team.destroy_all
User.destroy_all
Conversation.destroy_all
Library.destroy_all
Message.destroy_all
Meeting.destroy_all
Notification.destroy_all
puts "Clean database"
puts "-------------------------------"


puts "Creation of companies"
company1 = Company.create!(name: "The-Welcomer", address: "Le Wagon")
company2 = Company.create!(name: "Evolve", address: "Le Wagon")
company3 = Company.create!(name: "Hoops I did it again", address: "Le Wagon")
file1 = URI.open('https://lntp.net/wp-content/uploads/2016/12/Tesla-logo-2003-2500x2500.png')
file2 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/6/62/Logo_LOSC_Lille_2018.svg/1200px-Logo_LOSC_Lille_2018.svg.png')
company1.logo.attach(io: file1, filename: 'logo1.png', content_type: 'image/png')
company2.logo.attach(io: file2, filename: 'logo2.png', content_type: 'image/png')
puts "#{Company.count} companies created"
puts "-------------------------------"


puts "Creation of libraries"
library1 = Library.create!(label: "Rule", company_id: company1.id)
file4 = URI.open('https://cdn2.hubspot.net/hubfs/4419217/fullstack-syllabus%20(2).pdf')
library1.file.attach(io: file4, filename: 'pdf1.pdf', content_type: 'image/pdf' )
puts "#{Library.count} library created"
puts "-------------------------------"




puts "Creation of teams"
team1 = Team.create!(name: "Back-end development team",address: "Lille", company_id: company1.id)
team2 = Team.create!(name: "Artists of front-end",address: "Paris", company_id: company1.id)
team3 = Team.create!(name: "Community of comptability",address: "Lille", company_id: company1.id)
team4 = Team.create!(name: "Public relations",address: "Paris", company_id: company1.id)
file7 = URI.open("https://res.cloudinary.com/dsaxkp6xo/image/upload/v1607356904/tzr4htyim87e39kqrd6h6mo6qove.jpg")
file8 = URI.open("https://res.cloudinary.com/dsaxkp6xo/image/upload/v1607374200/wqdguh4fzdln9yj9xegsmgbdv4w9.jpg")
file9 = URI.open("https://res.cloudinary.com/dsaxkp6xo/image/upload/v1607417210/q4juw5me1vveonrvlbskrnepzgf3.jpg")
team1.photo.attach(io: file7, filename: 'image1.jpg', content_type: 'image/jpg')
team2.photo.attach(io: file8, filename: 'image2.jpg', content_type: 'image/jpg')
team3.photo.attach(io: file9, filename: 'image3.jpg', content_type: 'image/jpg')
puts "#{Team.count} teams created"
puts "-------------------------------"


puts "Creation of Users"
user1 = User.create!(first_name: "Caroline",last_name: "Bernard", email: "caroline@gmail.com", password: "azerty", job: "Supply chain", role:"Manager", company_id: company1.id, team_id: team1.id, description: "Studied Psychology and science of education for a while. I've been a school supervisor and now I'm learning code to become a fullstack developer. I want to gather enough experience points to level up into a freelancer or a 'digital nomad'.")
user2 = User.create!(first_name: "Louise",last_name: "Galliot", email: "louise@gmail.com", password: "azerty",job: "DRH", role:"RH", company_id: company1.id, team_id: team3.id, description: "Worked in civil works then port industry on IT software (TOS) implementations and specifications. Wish to switch from specifications to development.")
user3 = User.create!(first_name: "Charles",last_name: "Desplechin", email: "charle@gmail.com", password: "azerty", job: "Intern", role:"Newcomer", arrival_date: Date.today+54, company_id: company1.id, team_id: team1.id, description: "After a three-years experience in finance in the luxury, wines and spirits industries in Mexico City, I wanted to do a more creative job and work on different projects related to the tech industry. I want to work in Mexico and contribute to the tech and start-up ecosystem in this country.")
user4 = User.create!(first_name: "Jean",last_name: "Rooney", email: "jean@gmail.com", password: "azerty", job: "Supply chain", role:"Manager", company_id: company1.id, team_id: team2.id, description: "Graduate from Biology and Business school, I have been working in international retail for 10 years as Product manager, Category manager and Buyer. I took the opportunity to start a new challenge by attending Le Wagon Bootcamp and learn code!")
user5 = User.create!(first_name: "Pierre",last_name: "Xavi", email: "pierre@gmail.com", password: "azerty",job: "DRH", role:"RH", company_id: company1.id, team_id: team3.id, description: "I am studying in a business school in Paris and I am currently taking a gap year. During my internships, I felt the need to know more about web development in order to be efficient, that's why I am here !")
user6 = User.create!(first_name: "Ousmane",last_name: "Dembélé", email: "ousmane@gmail.com", password: "azerty", job: "Intern", role:"Newcomer", arrival_date: Date.today-5, company_id: company1.id, team_id: team2.id, description: "Hi, I am Ousmane. I did a Master French-German Management. I enjoy foreign languages and I am fluent in French, English and German. I learn to code because I want to be able to take part in IT projects. I find the IT-industry interesting and I love solving problems. I also have an idea for a start-up, so I might end up trying to launch one.")
user7 = User.create!(first_name: "Tim",last_name: "Mate", email: "tim@gmail.com", password: "azerty",job: "Developer", role:"Teammate", company_id: company1.id, team_id: team1.id, description: "Yo, I'm Tim. Mate. TeamMate, got it ?")
user8 = User.create!(first_name: "Chloé",last_name: "Quipuier", email: "chloé@gmail.com", password: "azerty", job: "Product Owner", role:"Teammate", company_id: company1.id, team_id: team2.id, description: "Hola, I'm Chloé. Before le wagon, I was in an engineering school. I chose to follow the wagon course in order to learn new technical skills. My wish is to work for a tech company as a product owner.")
file5 = URI.open('https://www.inserm.fr/sites/default/files/styles/thumbnail_scale_w814/public/2020-01/inserm_61188_JeromeGalon_Rub.png?itok=l-3gMvPh')
file6 = URI.open('https://gal.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2F2020.2F11.2F17.2F6e0ae737-b41f-4d37-af21-14267296feed.2Ejpeg/480x480/quality/80/the-crown-pourquoi-la-reine-elizabeth-ii-ne-regardera-certainement-pas.jpg')
file10 = URI.open("https://res.cloudinary.com/dsaxkp6xo/image/upload/v1607438352/au18vt14t6wo0ni426bjjkmyp3o3.jpg")
file11 = URI.open("https://assets-fr.imgfoot.com/media/cache/1200x900/media/ousmane-dembele-tout-sourire-lors-du-match-du-barca-contre-le-betis_262097.jpg")
file13 = URI.open("https://d302e0npexowb4.cloudfront.net/wp-content/uploads/2017/02/Snoopy-Peanuts.png")
file14 = URI.open("https://static1.purepeople.com/articles/3/34/20/23/@/4884986-chloe-grace-moretz-a-la-sortie-du-champ-624x600-2.jpg")
file15 = URI.open("https://cdn.radiofrance.fr/s3/cruiser-production/2020/07/d9f5c46d-edb6-46d9-b732-ead16ef3abcc/1136_000_1uk0su.jpg")
user2.photo.attach(io: file5, filename: 'logo5.jpg', content_type: 'image/jpg')
user1.photo.attach(io: file6, filename: 'logo6.jpg', content_type: 'image/jpg')
user3.photo.attach(io: file10, filename: 'logo7.jpg', content_type: 'image/jpg')
user6.photo.attach(io: file11, filename: 'logo9.jpg', content_type: 'image/jpg')
user7.photo.attach(io: file13, filename: 'logo18.jpg', content_type: 'image/jpg')
user8.photo.attach(io: file14, filename: 'logo18.jpg', content_type: 'image/jpg')
user5.photo.attach(io: file15, filename: 'logo18.jpg', content_type: 'image/jpg')

puts "#{User.count} users created"
puts "-------------------------------"


puts "Creation of Personal Library"
personallib1 = PersonalLibrary.create!(label: "CV", user_id: user3.id)
file12 = URI.open("https://www.creeruncv.com/sites/default/files/image-cv/132-cv-export-pdf.png")
personallib1.file.attach(io: file12, filename: 'pdf2.pdf', content_type: 'image/pdf' )
puts "#{PersonalLibrary.count} personal library created"
puts "-------------------------------"


puts "Creation of habits"
Habit.destroy_all
habit1 = Habit.create!(name: "Don't forget your pass every morning", user_id: user3.id)
habit2 = Habit.create!(name: "On tuesday, your turn to bring coffee", user_id: user3.id)
habit3 = Habit.create!(name:"Never mail someone out the company without checking the adress", user_id: user3.id)
habit4 = Habit.create!(name: "Please warn everyone when you are on holiday", user_id: user3.id)
habit5 = Habit.create!(name: "Home-office available on thursday and friday !", user_id: user3.id)
puts "#{Habit.count} habits created"
puts "-------------------------------"


puts "Creation Missions"
Mission.destroy_all
mission1 = Mission.create!(name: "Prepare the technical reunions", status: "Require help", description:'A meeting is a gathering of two or more people that has been convened for the purpose of achieving a common goal through verbal interaction, such as sharing information or reaching agreement. Meetings may occur face-to-face or virtually, as mediated by communications technology, such as a telephone conference call, a skyped conference call or a videoconference.', user_id: user3.id)
mission2 = Mission.create!(name:"Assist your coworkers", description: 'Schedule any meetings with your co-worker around their therapy sessions, but keep it to yourself. No one else in the meeting needs to know that theyre coping with depression.', user_id: user3.id)
mission3 = Mission.create!(name: "Watch for new tendances", status: "Mastered", description: ' In creative processes, mood boards can balance coordination and creative freedom', user_id: user3.id)
mission4 = Mission.create!(name:"Build commercial proposals", description: 'Managing proposals presents an enormous challenge for sales and marketing teams. Many established management methods are ill-suited to deal with the broader issues associated with the production and delivery of proposals. In these cases, organizations often rely on outsourcing.', user_id: user3.id)
mission5 = Mission.create!(name: "Invent water", description: 'this the most important part of your job. Please dont underestimate', user_id: user3.id)
mission6 = Mission.create!(name:"Build commercial proposals", status: "Mastered", description: 'Managing proposals presents an enormous challenge for sales and marketing teams. Many established management methods are ill-suited to deal with the broader issues associated with the production and delivery of proposals. In these cases, organizations often rely on outsourcing.', user_id: user6.id)
mission7 = Mission.create!(name:"Build commercial proposals", status: "Mastered", description: 'Managing proposals presents an enormous challenge for sales and marketing teams. Many established management methods are ill-suited to deal with the broader issues associated with the production and delivery of proposals. In these cases, organizations often rely on outsourcing.', user_id: user6.id)
mission8 = Mission.create!(name:"Build commercial proposals", description: 'Managing proposals presents an enormous challenge for sales and marketing teams. Many established management methods are ill-suited to deal with the broader issues associated with the production and delivery of proposals. In these cases, organizations often rely on outsourcing.', user_id: user6.id)

puts "#{Mission.count} missions created"
puts "-------------------------------"
puts "All good ! Ready to work :)"

