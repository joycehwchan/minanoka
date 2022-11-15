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
  file1 = URI.open("https://source.unsplash.com/1280x720?field")
  file2 = URI.open("https://source.unsplash.com/1280x720?field")
  file3 = URI.open("https://source.unsplash.com/1280x720?field")
  file4 = URI.open("https://source.unsplash.com/1280x720?field")
  file5 = URI.open("https://source.unsplash.com/1280x720?field")
  field = Field.new(name: Faker::Movies::StarWars.planet,
              size: rand(50..1500),
              description: Faker::Lorem.paragraph_by_chars,
              location: Faker::Address.full_address,
              price: rand(1500..50000),
              user_id: field_owner.id)
  field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.featured_img = field.images[0]
  field.save
end

## Creating fields for the test farmers

file1 = URI.open("https://source.unsplash.com/1280x720?field")
file2 = URI.open("https://source.unsplash.com/1280x720?field")
file3 = URI.open("https://source.unsplash.com/1280x720?field")
file4 = URI.open("https://source.unsplash.com/1280x720?field")
file5 = URI.open("https://source.unsplash.com/1280x720?field")
field = Field.new(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'apple@farmer.com').id)
field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

file1 = URI.open("https://source.unsplash.com/1280x720?field")
file2 = URI.open("https://source.unsplash.com/1280x720?field")
file3 = URI.open("https://source.unsplash.com/1280x720?field")
file4 = URI.open("https://source.unsplash.com/1280x720?field")
file5 = URI.open("https://source.unsplash.com/1280x720?field")
field = Field.new(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'apple@farmer.com').id)
field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

file1 = URI.open("https://source.unsplash.com/1280x720?field")
file2 = URI.open("https://source.unsplash.com/1280x720?field")
file3 = URI.open("https://source.unsplash.com/1280x720?field")
file4 = URI.open("https://source.unsplash.com/1280x720?field")
file5 = URI.open("https://source.unsplash.com/1280x720?field")
field = Field.new(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'orange@farmer.com').id)
field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

file1 = URI.open("https://source.unsplash.com/1280x720?field")
file2 = URI.open("https://source.unsplash.com/1280x720?field")
file3 = URI.open("https://source.unsplash.com/1280x720?field")
file4 = URI.open("https://source.unsplash.com/1280x720?field")
file5 = URI.open("https://source.unsplash.com/1280x720?field")
field = Field.new(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'orange@farmer.com').id)
field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

file1 = URI.open("https://source.unsplash.com/1280x720?field")
file2 = URI.open("https://source.unsplash.com/1280x720?field")
file3 = URI.open("https://source.unsplash.com/1280x720?field")
file4 = URI.open("https://source.unsplash.com/1280x720?field")
file5 = URI.open("https://source.unsplash.com/1280x720?field")
field = Field.new(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'pear@farmer.com').id)
field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

file1 = URI.open("https://source.unsplash.com/1280x720?field")
file2 = URI.open("https://source.unsplash.com/1280x720?field")
file3 = URI.open("https://source.unsplash.com/1280x720?field")
file4 = URI.open("https://source.unsplash.com/1280x720?field")
file5 = URI.open("https://source.unsplash.com/1280x720?field")
field = Field.new(name: Faker::Movies::StarWars.planet,
  size: rand(50..1500),
  description: Faker::Lorem.paragraph_by_chars,
  location: Faker::Address.full_address,
  price: rand(1500..50000),
  user_id: User.find_by(landowner: 'pear@farmer.com').id)
field.images.attach(io: file1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: file5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

puts " - Added #{Field.count} fields"

puts "--- [ Fields Done ] ---"

puts "#####"
