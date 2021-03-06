# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"
puts "cleaning up database"
# Item.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
Pet.destroy_all
DashboardCategory.destroy_all
ExpenseType.destroy_all
Expense.destroy_all
Place.destroy_all
FavouritePlace.destroy_all
Event.destroy_all

# Category.destroy_all
puts "database is clean"

puts 'Creating 15 user...'
user_1 = User.create!(first_name: "Diego", last_name: "tester", email: "diego@user.com", password: 111111, nickname: "Sundae")
user_2 = User.create!(first_name: "Cheena", last_name: "Elise", email: "cheena@user.com", password: 222222, nickname: "Yoshi")
user_3 = User.create!(first_name: "Aparna", last_name: "tester3", email: "user3@user.com", password: 333333, nickname: "Chef")
user_4 = User.create!(first_name: "Paal", last_name: "tester4", email: "user4@user.com", password: 444444, nickname: "Chilli")
user_5 = User.create!(first_name: "Glenn", last_name: "tester5", email: "user5@user.com", password: 555555, nickname: "Azlan")
user_6 = User.create!(first_name: "Aya", last_name: "tester6", email: "user6@user.com", password: 666666, nickname: "Marmaduke")
user_7 = User.create!(first_name: "Ray", last_name: "tester7", email: "user7@user.com", password: 777777, nickname: "Snowy")
user_8 = User.create!(first_name: "Christine", last_name: "tester8", email: "user8@user.com", password: 888888, nickname: "Bonnie")
user_9 = User.create!(first_name: "Manon", last_name: "tester9", email: "user9@user.com", password: 999999, nickname: "Peter")
user_10 = User.create!(first_name: "Kathy", last_name: "tester10", email: "user10@user.com", password: 101010, nickname: "Yoshi")

puts "#{User.count} User created..."

puts 'Creating 15 items...'

puts 'Creating pet 1...'
pet_1 = Pet.create(pet_name: 'Sundae', birthday: '07/07/1990', breed: "Silky Terrier", microchip: "123456", user_id: user_1.id )
file = URI.open('https://images.unsplash.com/photo-1443806798002-651c462956ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2252&q=80')
pet_1.photos.attach(io: file, filename: 'photo1.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1529672492404-b5bbe336c323?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_1.photos.attach(io: file, filename: 'photo2.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1572189538250-26f831611dfa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_1.photos.attach(io: file, filename: 'photo3.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1443806798002-651c462956ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2252&q=80')
pet_1.photos.attach(io: file, filename: 'photo4.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1576509742256-10c600f3b4a8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_1.photos.attach(io: file, filename: 'photo5.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1576509742243-c5a46ba7e93b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_1.photos.attach(io: file, filename: 'photo6.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1612830549030-bfb4b58ccd5f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_1.photos.attach(io: file, filename: 'photo7.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1591601523038-edc3dc8f20a7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_1.photos.attach(io: file, filename: 'photo8.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1585879903552-ba87d725fc81?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1016&q=80')
pet_1.photos.attach(io: file, filename: 'photo9.jpg', content_type: 'image/jpg')


#^^pet profile images 9 x generic photos of silky terrier^^
puts 'Creating pet 2...'

pet_2 = Pet.create(pet_name: 'Yoshi', birthday: '20/05/19', breed: "Boxer", microchip: "123456", user_id: user_2.id)
file = URI.open('https://images.unsplash.com/photo-1532202802379-df93d543bac3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_2.photos.attach(io: file, filename: 'photo1.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1594118319842-b72837a0ecea?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80')
pet_2.photos.attach(io: file, filename: 'photo2.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1590397986332-4df45c4afae9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_2.photos.attach(io: file, filename: 'photo3.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1598294848135-bbaf766de9b7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_2.photos.attach(io: file, filename: 'photo4.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1550894832-407b1aa5a3af?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80')
pet_2.photos.attach(io: file, filename: 'photo5.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1598294844922-d6ecc0d2f5ed?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_2.photos.attach(io: file, filename: 'photo6.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1523318500297-5de0dbf1dbd9?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=934&q=80')
pet_2.photos.attach(io: file, filename: 'photo7.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1591460913899-f8aa75ec0b73?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80')
pet_2.photos.attach(io: file, filename: 'photo8.jpg', content_type: 'image/jpg')
file = URI.open('https://images.unsplash.com/photo-1590011643604-38b1b6d73d1a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80')
pet_2.photos.attach(io: file, filename: 'photo9.jpg', content_type: 'image/jpg')

#^^ pet_2 profile images 9 x generic photos of boxer ^^

puts 'Creating pet 3 and on...'

pet_3 = Pet.create(pet_name: 'Arlo', birthday: '18/05/2019', breed: "Border Collie", microchip: "123456", user_id: user_3.id )
file = URI.open('https://images.unsplash.com/photo-1551097295-4c28e380cdf6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80')
pet_3.photos.attach(io: file, filename: 'photo3.jpg', content_type: 'image/jpg')

pet_4 = Pet.create(pet_name: 'Chef', birthday: '07/07/1990', breed: "Husky", microchip: "123456", user_id: user_4.id )
file = URI.open('https://images.unsplash.com/photo-1568572933382-74d440642117?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')
pet_4.photos.attach(io: file, filename: 'photo4.jpg', content_type: 'image/jpg')

pet_5 = Pet.create(pet_name: 'Chilli', birthday: '07/07/1990', breed: "Corgi", microchip: "123456", user_id: user_5.id )
file = URI.open('https://images.unsplash.com/photo-1570566998157-0df9e6f8d5f1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80')
pet_5.photos.attach(io: file, filename: 'photo5.jpg', content_type: 'image/jpg')

pet_6 = Pet.create(pet_name: 'Azlan', birthday: '07/07/1990', breed: "Silky Terrier", microchip: "123456", user_id: user_6.id )
file = URI.open('https://images.unsplash.com/photo-1591608971358-f93643d11763?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI3fHxkb2dzfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
pet_6.photos.attach(io: file, filename: 'photo6.jpg', content_type: 'image/jpg')

pet_7 = Pet.create(pet_name: 'Marmaduke', birthday: '07/07/1990', breed: "Doberman", microchip: "123456", user_id: user_7.id )
file = URI.open('https://images.unsplash.com/photo-1588095210434-3a062445f093?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
pet_7.photos.attach(io: file, filename: 'photo7.jpg', content_type: 'image/jpg')

pet_8 = Pet.create(pet_name: 'Snowy', birthday: '07/07/1990', breed: "Golden Retriever", microchip: "123456", user_id: user_8.id )
file = URI.open('https://images.unsplash.com/photo-1581434293783-79abdca76f3d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTU4fHxkb2dzfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=600')
pet_8.photos.attach(io: file, filename: 'photo8.jpg', content_type: 'image/jpg')

pet_9 = Pet.create(pet_name: 'Bonnie', birthday: '07/07/1990', breed: "Bulldog", microchip: "123456", user_id: user_9.id )
file = URI.open('https://images.unsplash.com/photo-1601245381370-4056f3f47526?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
pet_9.photos.attach(io: file, filename: 'photo9.jpg', content_type: 'image/jpg')

pet_10 = Pet.create(pet_name: 'Peter', birthday: '07/07/1990', breed: "Pug", microchip: "123456", user_id: user_10.id )
file = URI.open('https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_10.photos.attach(io: file, filename: 'photo10.jpg', content_type: 'image/jpg')


DashboardCategory.create!(name: "Calendar", url: "calendar.svg")
DashboardCategory.create!(name: "Expenses", url: "piggy-bank.svg")
DashboardCategory.create!(name: "Notes", url: "notes.svg")
DashboardCategory.create!(name: "Explore", url: "map.svg")
DashboardCategory.create!(name: "Photos", url: "photos.svg")
DashboardCategory.create!(name: "Friends", url: "pet-house.svg")
DashboardCategory.create!(name: "Chatroom", url: "chatroom.svg")


Event.create(pet_id: pet_1.id, name: "Le Wagon Demo Day!", description: "Sundae, Inspire9", start_time: "2021-03-20 04:00", end_time: "2021-03-20 04:30")
Event.create(pet_id: pet_1.id, name: "Bestie Beach Session", description: "The Gang: Snowy, Arlo, Marmaduke", start_time: "2021-03-20 09:00", end_time: "2021-03-20 09:30")
Event.create(pet_id: pet_1.id, name: "Play Date", description: "Play Date With Arlo", start_time: "2021-03-19 07:00", end_time: "2021-03-19 07:30")
Event.create(pet_id: pet_1.id, name: "Puppachino with Peter the Pug", description: "Sundae's Cafe", start_time: "2021-03-18 08:00", end_time: "2021-03-18 08:30")
Event.create(pet_id: pet_1.id, name: "Training Session", description: "Outdoor Training, to stop giving everyone so many kisses", start_time: "2021-03-17 11:00", end_time: "2021-03-17 11:30")
Event.create(pet_id: pet_1.id, name: "Ziwi Deluxe Tasting", description: "Tasting, organic GF, DF, SF, NF, RSF, PALEO", start_time: "2021-03-7 08:00", end_time: "2021-03-07 08:30")

puts "Creating Chatrooms"
#CHATROOM SEED

chatroom_general = Chatroom.create!(name: "General")
file = URI.open('https://res.cloudinary.com/daj0b5j8l/image/upload/v1615882832/Bestielife/chatroom-general_ywt9k1.jpg')
chatroom_general.photo.attach(io: file, filename: 'chatroom_general.jpg', content_type: 'image/jpg' )

chatroom_food = Chatroom.create!(name: "Food")
file = URI.open('https://res.cloudinary.com/daj0b5j8l/image/upload/v1616055862/karsten-winegeart-tIWBJN8t7zE-unsplash_tmqwg3.jpg')
chatroom_food.photo.attach(io: file, filename: 'chatroom_food.jpg', content_type: 'image/jpg')

chatroom_health = Chatroom.create!(name: "Health")
file = URI.open('https://res.cloudinary.com/daj0b5j8l/image/upload/v1615882833/Bestielife/chatroom-health_z8wtmr.jpg')
chatroom_health.photo.attach(io: file, filename: 'chatroom_health.jpg', content_type: 'image/jpg')

chatroom_explore = Chatroom.create!(name: "Explore")
file = URI.open('https://res.cloudinary.com/daj0b5j8l/image/upload/v1615882833/Bestielife/chatroom-explore_qxgsm5.jpg')
chatroom_explore.photo.attach(io: file, filename: 'chatroom_explore.jpg', content_type: 'image/jpg')

puts "Creating expense types"
#EXPENSE_TYPE SEED
expense_types_1 = ExpenseType.create!(name: "Food", img: 'dog-food.svg', actuals: 0, budget: 0)
expense_types_2 = ExpenseType.create!(name: "Health", img: "dog-health.svg", actuals: 0, budget: 0)
expense_types_3 = ExpenseType.create!(name: "Fashion", img: "collar.svg", actuals: 0, budget: 0)

puts "Creating budget"

Budget.create!(pet_id: pet_1.id, amount: 350, expense_type_id: expense_types_1.id, month: 'March')
Budget.create!(pet_id: pet_1.id, amount: 500, expense_type_id: expense_types_2.id, month: 'March')
Budget.create!(pet_id: pet_1.id, amount: 700, expense_type_id: expense_types_3.id, month: 'March')

puts "Creating expense"
#Food Expenses
Expense.create!(pet_id: pet_1.id, amount: 50, expense_type_id: expense_types_1.id, date: DateTime.new(2021, 3,3,5,6), description:'Ziwi Pebbles')
Expense.create!(pet_id: pet_1.id, amount: 150, expense_type_id: expense_types_1.id, date: DateTime.new(2021, 8,3,5,6), description:'Treats')
Expense.create!(pet_id: pet_1.id, amount: 70, expense_type_id: expense_types_1.id, date: DateTime.new(2021, 9,3,5,6), description:'Jerky Straps')
Expense.create!(pet_id: pet_1.id, amount: 10, expense_type_id: expense_types_1.id, date: DateTime.new(2021, 10,3,5,6), description:'Puppachinos')
Expense.create!(pet_id: pet_1.id, amount: 30, expense_type_id: expense_types_1.id, date: DateTime.new(2021, 11,3,5,6), description:'Doggie Cookies')
#Health Expenses
Expense.create!(pet_id: pet_1.id, amount: 100, expense_type_id: expense_types_2.id, date: DateTime.new(2021, 3,3,5,6), description:'Teeth Cleaning')
Expense.create!(pet_id: pet_1.id, amount: 50, expense_type_id: expense_types_2.id, date: DateTime.new(2021, 8,3,5,6), description:'Ear Drops')
Expense.create!(pet_id: pet_1.id, amount: 100, expense_type_id: expense_types_2.id, date: DateTime.new(2021, 9,3,5,6), description:'Vet Checkup')
Expense.create!(pet_id: pet_1.id, amount: 25, expense_type_id: expense_types_2.id, date: DateTime.new(2021, 10,3,5,6), description:'Medication')
#Fashion Expenses
Expense.create!(pet_id: pet_1.id, amount: 200, expense_type_id: expense_types_3.id, date: DateTime.new(2021, 3,3,5,6), description:'Gucci Collar')
Expense.create!(pet_id: pet_1.id, amount: 300, expense_type_id: expense_types_3.id, date: DateTime.new(2021, 8,3,5,6), description:'Versace Bedding')
Expense.create!(pet_id: pet_1.id, amount: 100, expense_type_id: expense_types_3.id, date: DateTime.new(2021, 9,3,5,6), description:'Manipaw')
Expense.create!(pet_id: pet_1.id, amount: 70, expense_type_id: expense_types_3.id, date: DateTime.new(2021, 10,3,5,6), description:'Celebrity Doggy Day Care')

puts 'Finished!'
