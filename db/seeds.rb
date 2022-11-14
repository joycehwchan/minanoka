# Seeds for database
#   - Users
#   - Fields

puts "--- [ Users ] ---"

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

puts "--- [ Users Done ] ---"

puts "#####"

puts "--- [ Fields ] ---"
puts "- Removing all fields!"
Field.destroy_all

15.times do
  field_owner = User.where("landowner = 'true'").sample
  Field.create!(name: Faker::Movies::StarWars.planet,
              size: rand(50..1500),
              location: Faker::Address.full_address,
              price: rand(1500..50000),
              user_id: field_owner.id)
end

puts " - Added #{Field.count} fields"

puts "--- [ Fields Done ] ---"

puts "#####"
