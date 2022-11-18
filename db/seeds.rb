# Seeds for database
#   - Users
#   - Fields
# Will make it look better later...
GEODATA = ["913-14 Jogasawa, Mutsu shi, Aomori ken",
           "507-12 Uchikanna, Chita gun taketoyo cho, Aichi ken",
           "611-3 Nikkocho, Moriguchi shi, Osaka fu",
           "710-16 Miirakumachi fuchinomoto, Goto shi, Nagasaki ken",
           "965-10 Sanjocho, Ashiya shi, Hyogo ken",
           "996-8 Oba, Hitachiomiya shi, Ibaraki ken",
           "814-10 Kuchida, Chita gun taketoyo cho, Aichi ken",
           "58-18 Katsumotocho nakafure, Iki shi, Nagasaki ken",
           "838-14 Kumanogawacho nishi, Shingu shi, Wakayama ken",
           "686-18 Atago hamamachi, Maizuru shi, Kyoto fu",
           "615-20 Sakuramachi, Miyazaki shi, Miyazaki ken",
           "72-12 Takazumi, Iwami gun iwami cho, Tottori ken",
           "704-2 Nakasonecho, Okinawa shi, Okinawa ken",
           "12-13 Ogawa, Tone gun minakami machi, Gumma ken",
           "833-18 Ishidamachi, Nobeoka shi, Miyazaki ken",
           "3-589-7 Kuminoki, Osakasayama shi, Osaka fu",
           "989-8 Tomizawa, Soma shi, Fukushima ken",
           "734-1 Katagihara sugiharacho, Kyoto shi nishikyo ku, Kyoto fu",
           "464-18 Mitsuyamotocho, Nagahama shi, Shiga ken",
           "201-10 Soryocho inakusa, Shobara shi, Hiroshima ken",
           "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
           "629-10 Nishikikyocho, Hakodate shi, Hokkaido",
           "626-6 Ogi, Kikuchi shi, Kumamoto ken",
           "832-3 Fukuyoshi, Tohaku gun misasa cho, Tottori ken",
           "423-16 Yakushiji, Shimotsuke shi, Tochigi ken",
           "753-13 Namioka shimoishikawa, Aomori shi, Aomori ken",
           "753-4 Oasa takamachi, Ebetsu shi, Hokkaido",
           "110-5 Kamimikusa, Kato shi, Hyogo ken",
           "155-13 Higashifuruichiba, Kawasaki shi saiwai ku, Kanagawa ken",
           "711-11 Kurahashicho, Kure shi, Hiroshima ken",
           "356-3 Muyacho kizu, Naruto shi, Tokushima ken",
           "354-20 Awacho inari, Awa shi, Tokushima ken",
           "567-1 Misakacho ninomiya, Fuefuki shi, Yamanashi ken",
           "141-10 Ichibu, Kuma gun nishiki machi, Kumamoto ken",
           "755-16 Omagari midoricho, Daisen shi, Akita ken",
           "133-17 Irio, Nyu gun echizen cho, Fukui ken",
           "18-17 Uwamachi, Odate shi, Akita ken",
           "690-17 Tonemachi okkai, Numata shi, Gumma ken",
           "614-10 Takegaki, Chikusei shi, Ibaraki ken",
           "832-10 Matsuo dairicho, Kyoto shi nishikyo ku, Kyoto fu",
           "189-8 Minamiabuzaka, Tokamachi shi, Niigata ken",
           "695-16 Saidaiji gomyo, Okayama shi higashi ku, Okayama ken",
           "229-5 Higashimachi, Iwakura shi, Aichi ken"]
puts "--- [ Users ] ---"

puts " - Removing all users!"
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
puts " - Removing all fields!"
Field.destroy_all

def field_count
  puts "... have added #{Field.count} fields (out of 12). Please wait!"
end

12.times do
  field_owner = User.where("landowner = 'true'").sample
  field = Field.new(name: Faker::Movies::StarWars.planet,
                    size: rand(50..1500),
                    rich_description: Faker::Lorem.paragraph_by_chars,
                    location: GEODATA.sample,
                    price: rand(1500..5000),
                    user_id: field_owner.id)
  field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?field").open,
                      filename: "#{rand(0..9999)}-field.png",
                      content_type: "image/png")
  field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?farm").open,
                      filename: "#{rand(0..9999)}-field.png",
                      content_type: "image/png")
  field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?flour").open,
                      filename: "#{rand(0..9999)}-field.png",
                      content_type: "image/png")
  field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?farmer").open,
                      filename: "#{rand(0..9999)}-field.png",
                      content_type: "image/png")
  field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?tomatoes").open,
                      filename: "#{rand(0..9999)}-field.png",
                      content_type: "image/png")
  field.featured_img = field.images.first.key
  field.save!
  field_count
end

## Creating fields for the test farmers
puts " - Creating the extra fields for test farmers now... Please wait!"

test_farmers = ["apple@farmer.com", "orange@farmer.com", "pear@farmer.com"]
2.times do
  test_farmers.each do |farmer|
    field = Field.new(name: Faker::Movies::StarWars.planet,
                      size: rand(50..1500),
                      rich_description: Faker::Lorem.paragraph_by_chars,
                      location: Faker::Address.full_address,
                      price: rand(1500..5000),
                      user_id: User.find_by(landowner: farmer).id)
    field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?field").open,
                        filename: "#{rand(0..9999)}-field.png",
                        content_type: "image/png")
    field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?farm").open,
                        filename: "#{rand(0..9999)}-field.png",
                        content_type: "image/png")
    field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?flour").open,
                        filename: "#{rand(0..9999)}-field.png",
                        content_type: "image/png")
    field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?farmer").open,
                        filename: "#{rand(0..9999)}-field.png",
                        content_type: "image/png")
    field.images.attach(io: URI.parse("https://source.unsplash.com/640x360?tomatoes").open,
                        filename: "#{rand(0..9999)}-field.png",
                        content_type: "image/png")
    field.featured_img = field.images.first.key
    field.save
    field_count
  end
end

puts " - Added #{Field.count} fields!"
puts "--- [ Fields Done ] ---"
puts "--- [ Bookings ] ---"
puts " - Removing all bookings!"
Booking.destroy_all

date_from_setter = Date.today
date_to_setter = date_from_setter + rand(7..30)

50.times do
  field_setter = Field.all.sample
  booking = Booking.new(date_from: date_from_setter,
                        date_to: date_to_setter,
                        price_per_day: field_setter.price,
                        status: Booking.statuses.keys.sample,
                        user: User.where("landowner = false").sample,
                        field: field_setter)
  booking.save!
  date_from_setter += 31
  date_to_setter = date_from_setter + rand(7..30)
  puts " - Created booking #{booking.date_from} to #{booking.date_to}"
  puts " - There are #{Booking.count} booking(s) created (out of 50)..."
end

puts " - Creating specific bookings for the TEST RENTERS"
test_renters = ["blue@renter.com", "red@renter.com", "green@renter.com"]
date_to_setter = date_from_setter + rand(7..30)

5.times do
  test_renters.each do |renter|
    field_setter = Field.all.sample
    booking = Booking.new(date_from: date_from_setter,
                          date_to: date_to_setter,
                          price_per_day: field_setter.price,
                          status: Booking.statuses.keys.sample,
                          user: User.find_by(email: renter),
                          field: field_setter)
    booking.save!
    date_from_setter += 31
    date_to_setter = date_from_setter + rand(7..30)
    puts " - Created booking for TEST RENTER #{booking.date_from} to #{booking.date_to}"
    puts " - There are #{Booking.count} booking(s) created..."
  end
end

puts "--- [ Test Bookings for TEST RENTERS are completed ] ---"
puts "#####"
puts "--- [ Reviews ] ---"
puts " - Removing all reviews!"
Review.destroy_all
Booking.all.each do |booking|
  review = Review.new(rating: rand(1..5),
                      content: Faker::Lorem.paragraph_by_chars,
                      user: booking.user,
                      field: booking.field)
  review.save!
  puts " - Created 1 Review with rating: #{review.rating} for field #{review.field} (belonging to #{review.user})"
  puts " - There are #{Review.count} review(s) created (out of 50)..."
end

puts "################"
puts "All seeds done!"
