# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# PACKAGES = [
#   "Intro Lesson",
#   "Single Lesson",
#   "Five Lesson Package"
# ]

# PACKAGE_DESCRIPTION = [
#   "Perfect to get to know the teacher and try it out at low cost",
#   "Stand alone lesson",
#   "Best deal at a 25% discount!"
# ]

# PRICE = [
#   15,
#   40,
#   160
# ]
# puts "Destroy all data in database..."
# Lesson.destroy_all
# Booking.destroy_all
# Host.destroy_all
# User.destroy_all

# puts "Creating a new database..."

# visitor = User.create!(
#   email: "visitor@lewagon.com",
#   password: "lewagon",
#   first_name: "visitor",
#   last_name: "lewagon",
#   phone_number: "07595096963",
# )

# host = Host.create!(
#   email: "host@lewagon.com",
#   password: "lewagon",
#   name: "host",
#   phone_number: "07595096963",
#   address: "138 Kingsland road",
# )

# i = 0
# 3.times do
#   lesson = Lesson.create!(
#     name: PACKAGES[i],
#     description: PACKAGE_DESCRIPTION[i],
#     price: PRICE[i],
#     host_id: host.id
#   )
#   i += 1
# end

# Booking.create!(
#   booking_date: Faker::Date.between(from: '2022-06-23', to: '2022-11-23'),
#   lesson_id: Lesson.first.id,
#   user_id: visitor.id,
#   host_id: host.id
# )

# Booking.create!(
#   booking_date: Faker::Date.between(from: '2022-06-23', to: '2022-11-23'),
#   lesson_id: Lesson.last.id,
#   user_id: visitor.id,
#   # host_id: host.id
# )

# puts "Database seed completed!"

require "open-uri"
require "json"

puts "Cleaning up database..."

Booking.destroy_all
Slot.destroy_all
Lesson.destroy_all
User.destroy_all

puts "Database cleaned"

#SEEDED USERS!!!
user1 = User.create!(
  email: 'visitor@drum.com',
  password: '123456',
  first_name: 'visitor',
  last_name: 'drum',
  phone_number: '07595096963',
  is_host: true
)
puts "user #{user1.id}"

#SEEDED LESSONS!!!
lesson = Lesson.create!(
  name: 'Beginner Drum Class',
  description: 'Perfect to get to know the teacher and try it out at low cost',
  price: 15,
  user_id: user1.id
)
file = URI.open("app/assets/images/Musicon-Drummer-01.png")
lesson.photo.attach(io: file, filename: "Musicon-Drummer-01.png", content_type: "image/png")
lesson.save!
puts 'lesson saved'
i = 10
until i == 23
  slot1 = Slot.create!(lesson_id: lesson.id, start_time: Time.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end
slot1.save!
puts 'slot1 saved'

lesson4 = Lesson.create!(
  name: 'Intermediate Drum Class',
  description: 'Great for those with a comfortable skillset and would like to advance further',
  price: 25,
  user_id: user1.id
)
i = 10
until i == 23
  Slot.create!(lesson_id: lesson4.id, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

lesson.save!
puts 'lesson4 saved'

lesson5 = Lesson.create!(
  name: 'Expert Drum Class',
  description: 'For seasoned students',
  price: 15,
  user_id: user1.id
)
i = 10
until i == 23
  Slot.create!(lesson_id: lesson5.id, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
  i += 1
end

lesson.save!
puts 'lesson5 saved'

# lesson2 = Lesson.create!(
#   name: 'Single lesson',
#   description: 'Single stand alone lesson',
#   price: 15,
#   user_id: user1.id
# )
# i = 10
# until i == 23
#   Slot.create!(lesson_id: lesson2.id, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
#   i += 1
# end
# lesson.save!

# puts 'lesson2 saved'

# lesson3 = Lesson.create!(
#   name: 'Single lesson',
#   description: 'package of 5 lessons',
#   price: 50,
#   user_id: user1.id
# )
# i = 10
# until i == 23
#   Slot.create!(lesson_id: lesson3.id, start_time: DateTime.new(2022, 12, 2, i, 0, 0), end_time: DateTime.new(2022, 12, 2, (i+1), 0, 0) )
#   i += 1
# end

# lesson.save!
# puts 'lesson3 saved'


#SEEDED BOOKINGS!!!
Booking.create!(
  booking_date: Date.today,
  user_id: user1.id,
  slot_id: slot1.id
)
