# Seeds for database
#   - Users
#   - Fields
# Will make it look better later...

puts "--- [ Users ] ---"

puts " - Removing all users!"
User.destroy_all

25.times do
  is_farmer = [true, false].sample
  User.create!(email: Faker::Internet.email, password: "AwesomePassword!123", name: Faker::Name.name, landowner: is_farmer)
end

# Test Accounts
## Renters
User.create!(email: "blue@renter.com", password: "AwesomePassword!123", name: "Renter Blue", landowner: false)

User.create!(email: "red@renter.com", password: "AwesomePassword!123", name: "Renter Red", landowner: false)

User.create!(email: "green@renter.com", password: "AwesomePassword!123", name: "Renter Green", landowner: false)

## Farmers
User.create!(email: "apple@farmer.com", password: "AwesomePassword!123", name: "Farmer Apple", landowner: true)

User.create!(email: "orange@farmer.com", password: "AwesomePassword!123", name: "Farmer Orange", landowner: true)

User.create!(email: "pear@farmer.com", password: "AwesomePassword!123", name: "Farmer Pear", landowner: true)

puts " - Added #{User.count} users"

puts "--- [ Users Done ] ---"

puts "#####"

puts "--- [ Fields ] ---"
puts "- Removing all fields!"
Field.destroy_all

def seed_field_img_set

end

def seed_field_img_attach

end

def field_count
  puts "... have added #{Field.count} fields. Plz wait! "
end
5.times do
  field_owner = User.where("landowner = 'true'").sample
  unspash_img = "https://source.unsplash.com/640x360?field"
  img_1 = URI.parse(unspash_img).open
  img_2 = URI.parse(unspash_img).open
  img_3 = URI.parse(unspash_img).open
  img_4 = URI.parse(unspash_img).open
  img_5 = URI.parse(unspash_img).open
  field = Field.new(name: Faker::Movies::StarWars.planet,
                    size: rand(50..1500),
                    description: Faker::Lorem.paragraph_by_chars,
                    location: Faker::Address.full_address,
                    price: rand(1500..5000),
                    user_id: field_owner.id)
  field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
  field.featured_img = field.images
  field.save
  field_count
end

## Creating fields for the test farmers
puts " - Creating the extra fields for test farmers now..."

unspash_img = "https://source.unsplash.com/640x360?field"
img_1 = URI.parse(unspash_img).open
img_2 = URI.parse(unspash_img).open
img_3 = URI.parse(unspash_img).open
img_4 = URI.parse(unspash_img).open
img_5 = URI.parse(unspash_img).open
field = Field.new(name: Faker::Movies::StarWars.planet,
                  size: rand(50..1500),
                  description: Faker::Lorem.paragraph_by_chars,
                  location: Faker::Address.full_address,
                  price: rand(1500..5000),
                  user_id: User.find_by(landowner: 'apple@farmer.com').id)
field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save
field_count

unspash_img = "https://source.unsplash.com/640x360?field"
img_1 = URI.parse(unspash_img).open
img_2 = URI.parse(unspash_img).open
img_3 = URI.parse(unspash_img).open
img_4 = URI.parse(unspash_img).open
img_5 = URI.parse(unspash_img).open
field = Field.new(name: Faker::Movies::StarWars.planet,
                  size: rand(50..1500),
                  description: Faker::Lorem.paragraph_by_chars,
                  location: Faker::Address.full_address,
                  price: rand(1500..5000),
                  user_id: User.find_by(landowner: 'apple@farmer.com').id)
field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save
field_count

unspash_img = "https://source.unsplash.com/640x360?field"
img_1 = URI.parse(unspash_img).open
img_2 = URI.parse(unspash_img).open
img_3 = URI.parse(unspash_img).open
img_4 = URI.parse(unspash_img).open
img_5 = URI.parse(unspash_img).open
field = Field.new(name: Faker::Movies::StarWars.planet,
                  size: rand(50..1500),
                  description: Faker::Lorem.paragraph_by_chars,
                  location: Faker::Address.full_address,
                  price: rand(1500..5000),
                  user_id: User.find_by(landowner: 'orange@farmer.com').id)
field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save
field_count

unspash_img = "https://source.unsplash.com/640x360?field"
img_1 = URI.parse(unspash_img).open
img_2 = URI.parse(unspash_img).open
img_3 = URI.parse(unspash_img).open
img_4 = URI.parse(unspash_img).open
img_5 = URI.parse(unspash_img).open
field = Field.new(name: Faker::Movies::StarWars.planet,
                  size: rand(50..1500),
                  description: Faker::Lorem.paragraph_by_chars,
                  location: Faker::Address.full_address,
                  price: rand(1500..5000),
                  user_id: User.find_by(landowner: 'orange@farmer.com').id)
field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save
field_count

unspash_img = "https://source.unsplash.com/640x360?field"
img_1 = URI.parse(unspash_img).open
img_2 = URI.parse(unspash_img).open
img_3 = URI.parse(unspash_img).open
img_4 = URI.parse(unspash_img).open
img_5 = URI.parse(unspash_img).open
field = Field.new(name: Faker::Movies::StarWars.planet,
                  size: rand(50..1500),
                  description: Faker::Lorem.paragraph_by_chars,
                  location: Faker::Address.full_address,
                  price: rand(1500..5000),
                  user_id: User.find_by(landowner: 'pear@farmer.com').id)
field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save
field_count

unspash_img = "https://source.unsplash.com/640x360?field"
img_1 = URI.parse(unspash_img).open
img_2 = URI.parse(unspash_img).open
img_3 = URI.parse(unspash_img).open
img_4 = URI.parse(unspash_img).open
img_5 = URI.parse(unspash_img).open
field = Field.new(name: Faker::Movies::StarWars.planet,
                  size: rand(50..1500),
                  description: Faker::Lorem.paragraph_by_chars,
                  location: Faker::Address.full_address,
                  price: rand(1500..5000),
                  user_id: User.find_by(landowner: 'pear@farmer.com').id)
field.images.attach(io: img_1, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_2, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_3, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_4, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.images.attach(io: img_5, filename: "#{rand(0..9999)}-field.png", content_type: "image/png")
field.featured_img = field.images[0]
field.save

puts " - Added #{Field.count} fields!"

puts "--- [ Fields Done ] ---"


puts "--- [ Bookings ] ---"

puts " - Removing all bookings!"
Booking.destroy_all

date_from_setter = Date.today;
date_to_setter = date_from_setter + rand(7..30)

5.times do
  field_setter = Field.all.sample
  booking = Booking.new(date_from: date_from_setter,
                        date_to: date_to_setter,
                        price_per_day: field_setter.price,
                        status: ["pending", "confirmed", "rejected"].sample,
                        user: User.where("landowner = false").sample,
                        field: Field.all.sample)
  booking.save
  date_from_setter += 31
  date_to_setter = date_from_setter + rand(7..30)
  puts " - Created booking #{booking.date_from} to #{booking.date_to}"
  puts " - There are #{Booking.count} booking(s) created..."
end
puts "################"
puts "All seeds done!"
