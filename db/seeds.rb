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
user_1 = User.create!(first_name: "test", last_name: "tester", email: "user@user.com", password: 111111)
# user_2 = User.create!(email: "paal@user.com", password: 222222)
# user_3 = User.create!(email: "aparna@user.com", password: 333333)
# user_4 = User.create!(email: "diego@user.com", password: 444444)
# user_5 = User.create!(email: "cheena@user.com", password: 555555)
# user_6 = User.create!(email: "guido@user.com", password: 666666)
# user_7 = User.create!(email: "ray@user.com", password: 777777)
# user_8 = User.create!(email: "christine@user.com", password: 888888)
# user_9 = User.create!(email: "nine@user.com", password: 999999)
# user_10 = User.create!(email: "ten@user.com", password: 111111)
# user_11 = User.create!(email: "eleven@user.com", password: 111111)
# user_12 = User.create!(email: "twelve@user.com", password: 222222)
# user_13 = User.create!(email: "thirteen@user.com", password: 333333)
# user_14 = User.create!(email: "fourteen@user.com", password: 444444)
# user_15 = User.create!(email: "fifteen@user.com", password: 555555)
puts "#{User.count} User created..."

puts 'Creating 15 items...'

pet_1 = Pet.create(pet_name: 'Sundae', birthday: '07/07/1990' , breed: "Silky Terrier", microchip: "123456", user_id: user_1.id )
file = URI.open('https://images.unsplash.com/photo-1443806798002-651c462956ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2252&q=80')
pet_1.photo.attach(io: file, filename: 'photo1.jpg', content_type: 'image/jpg')

DashboardCategory.create!(name: "Calendar", url: "calendar.svg")
DashboardCategory.create!(name: "Expenses", url: "piggy-bank.svg")
DashboardCategory.create!(name: "Notes", url: "notes.svg")
DashboardCategory.create!(name: "Explore", url: "map.svg")
DashboardCategory.create!(name: "Photos", url: "gallery.svg")
DashboardCategory.create!(name: "Friends", url: "pet-house.svg")

Event.create(pet_id: pet_1.id, name: "Vet", description: "Appointment", start_time: "2021-02-24 04:57", end_time: "2021-02-24 06:57")

puts 'Creating 10 friends...'

friend_1 = Friend.create(name: 'Douglas', pet_id: pet_1.id)
file = URI.open ('https://images.unsplash.com/photo-1568572933382-74d440642117?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')

friend_2 = Friend.create(name:'Wally', pet_id: pet_2.id)
file = URI.open ('https://images.unsplash.com/photo-1570566998157-0df9e6f8d5f1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80')

friend_3 = Friend.create(name: 'Margot', pet_id: pet_3.id )
file = URI.open ('https://images.unsplash.com/photo-1543490258-4131d44881d7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=734&q=80')
friend_4 = Friend.create(name: 'Arthur', pet_id: pet_4.id)
file = URI.open('https://images.unsplash.com/photo-1576525773377-c77530178f6a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
friend_5 = Friend.create(name: 'Molly', pet_id: pet_5.id )
file = URI.open('https://images.unsplash.com/photo-1577767650197-e3c45dad02dc?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTR8fGRvZ3N8ZW58MHwxfDB8&auto=format&fit=crop&w=800&q=60')
friend_6 = Friend.create(name: 'Trixie', pet_id: pet_6.id )
file = URI.open('https://images.unsplash.com/photo-1591608971358-f93643d11763?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI3fHxkb2dzfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
friend_7 = Friend.create(name: 'Marmaduke', pet_id: pet_7.id)
file = URI.open('https://images.unsplash.com/photo-1588095210434-3a062445f093?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
friend_8 = Friend.create(name: 'Snowy', pet_id: pet_8.id)
file = URI.open('https://images.unsplash.com/photo-1581434293783-79abdca76f3d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTU4fHxkb2dzfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
friend_9 = Friend.create(name: 'Buddy', pet_id: pet_9.id)
file = URI.open('https://images.unsplash.com/photo-1601245381370-4056f3f47526?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
friend_10 = Friend.create(name: 'Poppy', pet_id: pet_10.id)
file = URI.open('https://images.unsplash.com/photo-1591116302387-58db066ced5f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjc5fHxkb2dzfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
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
# item_12.photo.attach(io: file, filename: 'photo12.jpg', content_type: 'image/jpg')

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
