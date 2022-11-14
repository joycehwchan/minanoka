# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "- Removing all users!"
User.destroy_all

25.times do
  is_farmer = [true, false].sample
  User.create!(email: Faker::Internet.email,
              password: "AwesomePassword!123",
              name: Faker::Name.name,
              landowner: is_farmer)
end

puts " - Added #{User.count} users"
