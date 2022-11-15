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

# Test Accounts
## Renters
User.create!(email: "blue@renter.com",
  password: "AwesomePassword!123",
  name: "Renter Blue",
  landowner: false)

User.create!(email: "red@renter.com",
  password: "AwesomePassword!123",
  name: "Renter Red",
  landowner: false)

User.create!(email: "green@renter.com",
  password: "AwesomePassword!123",
  name: "Renter Green",
  landowner: false)

## Farmers
User.create!(email: "apple@farmer.com",
  password: "AwesomePassword!123",
  name: "Farmer Apple",
  landowner: true)

User.create!(email: "orange@farmer.com",
  password: "AwesomePassword!123",
  name: "Farmer Orange",
  landowner: true)

User.create!(email: "pear@farmer.com",
  password: "AwesomePassword!123",
  name: "Farmer Pear",
  landowner: true)

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
              description: Faker::Lorem.paragraph_by_chars,
              location: Faker::Address.full_address,
              price: rand(1500..50000),
              user_id: field_owner.id)
end

## Creating fields for the test farmers

Field.create!(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'apple@farmer.com').id)

Field.create!(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'apple@farmer.com').id)

Field.create!(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'orange@farmer.com').id)

Field.create!(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'orange@farmer.com').id)

Field.create!(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'pear@farmer.com').id)

Field.create!(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'pear@farmer.com').id)

puts " - Added #{Field.count} fields"

puts "--- [ Fields Done ] ---"

puts "#####"
