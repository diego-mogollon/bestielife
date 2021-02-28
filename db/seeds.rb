# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
puts "cleaning up database"
# Item.destroy_all
User.destroy_all
DashboardCategory.destroy_all
# Category.destroy_all
puts "database is clean"

puts 'Creating 15 user...'
user_1 = User.create!(first_name: "test", last_name: "tester", email: "user@user.com", password: 111111, nickname: "test")
user_2 = User.create!(first_name: "test2", last_name: "tester2", email: "user2@user.com", password: 222222, nickname: "test2")
user_3 = User.create!(first_name: "test3", last_name: "tester3", email: "user3@user.com", password: 333333)
user_4 = User.create!(first_name: "test4", last_name: "tester4", email: "user4@user.com", password: 444444)
user_5 = User.create!(first_name: "tes5", last_name: "tester5", email: "use5@user.com", password: 555555)
user_6 = User.create!(first_name: "test6", last_name: "tester6", email: "user6@user.com", password: 666666)
user_7 = User.create!(first_name: "test7", last_name: "tester7", email: "user7@user.com", password: 777777)
user_8 = User.create!(first_name: "test8", last_name: "tester8", email: "user8@user.com", password: 888888)
user_9 = User.create!(first_name: "test9", last_name: "tester9", email: "user9@user.com", password: 999999)
user_10 = User.create!(first_name: "test10", last_name: "tester10", email: "user10@user.com", password: 101010)

puts "#{User.count} User created..."

puts 'Creating 15 items...'
#individual pet profiles, pet_1 & pet_2 have 9 photos specific to their breed. Note to update to actual Sundae Pictures?
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

pet_2 = Pet.create(pet_name: 'Yoshi', birthday: '07/07/1990', breed: "Boxer", microchip: "123456", user_id: user_2.id )
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
file = URI.open('https://images.unsplash.com/photo-1551097295-4c28e380cdf6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
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

pet_9 = Pet.create(pet_name: 'Azlan', birthday: '07/07/1990', breed: "Bulldog", microchip: "123456", user_id: user_9.id )
file = URI.open('https://images.unsplash.com/photo-1601245381370-4056f3f47526?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
pet_9.photos.attach(io: file, filename: 'photo9.jpg', content_type: 'image/jpg')

pet_10 = Pet.create(pet_name: 'Peter', birthday: '07/07/1990', breed: "Pug", microchip: "123456", user_id: user_10.id )
file = URI.open('https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
pet_10.photos.attach(io: file, filename: 'photo10.jpg', content_type: 'image/jpg')


DashboardCategory.create!(name: "Calendar", url: "calendar.svg")
DashboardCategory.create!(name: "Expenses", url: "piggy-bank.svg")
DashboardCategory.create!(name: "Notes", url: "notes.svg")
DashboardCategory.create!(name: "Explore", url: "map.svg")
DashboardCategory.create!(name: "Photos", url: "gallery.svg")
DashboardCategory.create!(name: "Friends", url: "pet-house.svg")

Event.create(pet_id: pet_1.id, name: "Vet", description: "Appointment", start_time: "2021-02-24 04:57", end_time: "2021-02-24 06:57")



# item_2 = Item.create(name: 'Tulum', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "S", user_id: user_2.id )
# file = URI.open('https://images.unsplash.com/photo-1602910344079-28d7dbc45a38?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
# item_2.photo.attach(io: file, filename: 'photo2.jpg', content_type: 'image/jpg')

# item_3 = Item.create(name: 'Melbourne Fash', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "M", user_id: user_3.id )
# file = URI.open('https://images.unsplash.com/photo-1602421546495-3431c3833a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
# item_3.photo.attach(io: file, filename: 'photo3.jpg', content_type: 'image/jpg')

# item_4 = Item.create(name: 'Maha', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "L", user_id: user_4.id )
# file = URI.open('https://images.unsplash.com/photo-1593178395567-387dd4d73ae4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1276&q=80')
# item_4.photo.attach(io: file, filename: 'photo4.jpg', content_type: 'image/jpg')

# item_5 = Item.create(name: 'Sydney Sunset', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "L", user_id: user_5.id )
# file = URI.open('https://images.unsplash.com/photo-1600099867395-da7b6be75e14?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80')
# item_5.photo.attach(io: file, filename: 'photo5.jpg', content_type: 'image/jpg')

# item_6 = Item.create(name: 'Breezy Noosa', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XL", user_id: user_6.id )
# file = URI.open('https://images.unsplash.com/photo-1570675762278-972810ed3c5d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1301&q=80')
# item_6.photo.attach(io: file, filename: 'photo6.jpg', content_type: 'image/jpg')

# item_7 = Item.create(name: 'Sunshine Coast', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_7.id )
# file = URI.open('https://images.unsplash.com/photo-1542295669297-4d352b042bca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80')
# item_7.photo.attach(io: file, filename: 'photo7.jpg', content_type: 'image/jpg')

# item_8 = Item.create(name: 'Daintree', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_8.id )
# file = URI.open('https://images.unsplash.com/photo-1612722432474-b971cdcea546?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=882&q=80')
# item_8.photo.attach(io: file, filename: 'photo8.jpg', content_type: 'image/jpg')

# item_9 = Item.create(name: 'Sundae', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_9.id )
# file = URI.open('https://images.unsplash.com/photo-1606480195899-f1c11b60b887?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=975&q=80')
# item_9.photo.attach(io: file, filename: 'photo9.jpg', content_type: 'image/jpg')

# item_10 = Item.create(name: 'Arlo', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_10.id )
# file = URI.open('https://images.unsplash.com/photo-1584499891650-31e4dd7bca76?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
# item_10.photo.attach(io: file, filename: 'photo10.jpg', content_type: 'image/jpg')

# item_11 = Item.create(name: 'Midnight Kitty', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_11.id )
# file = URI.open('https://images.unsplash.com/photo-1584499891650-31e4dd7bca76?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')
# item_11.photo.attach(io: file, filename: 'photo11.jpg', content_type: 'image/jpg')

# item_12 = Item.create(name: 'Stormy Thunder', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_12.id )
# file = URI.open('https://images.unsplash.com/photo-1603633247906-4746fea3141a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80')


# item_13 = Item.create(name: 'Chanel', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_13.id )
# file = URI.open('https://images.unsplash.com/photo-1599593589368-d88e60c5fec5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1263&q=80')
# item_13.photo.attach(io: file, filename: 'photo13.jpg', content_type: 'image/jpg')

# item_14 = Item.create(name: 'Lacoste', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_14.id )
# file = URI.open('https://images.unsplash.com/photo-1565115021788-6d3f1ede4980?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1258&q=80')
# item_14.photo.attach(io: file, filename: 'photo14.jpg', content_type: 'image/jpg')

# item_15 = Item.create(name: 'Armani', price: rand(30..100), description: "Phasellus pretium mauris erat, at egestas massa accumsan vel.", size: "XXL", user_id: user_15.id )
# file = URI.open('https://images.unsplash.com/photo-1580309398776-95122ddf016c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=3000&q=80')
# item_15.photo.attach(io: file, filename: 'photo15.jpg', content_type: 'image/jpg')

# puts "#{Item.count} Item created..."

# puts 'Creating 2 bookings'
# booking_1 = Booking.create(user_id: user_1.id, item_id: item_2.id, start_date: Time.now, end_date: Time.now + 1.day)
# booking_2 = Booking.create(user_id: user_2.id, item_id: item_1.id, start_date: Time.now, end_date: Time.now + 1.day)


# [['Date Night', 'category_images/cocktail.svg'], ['Daytime', 'category_images/sun.svg'],['Work','category_images/suitcase.svg'], ['Casual', 'category_images/dress.svg'], ['Everyday', 'category_images/clothes-hanger.svg'], ['Maternity', 'category_images/mother.svg']].each  do |category|
#   Category.create(name: category[0], image: category[1])
#   end

puts 'Finished!'
