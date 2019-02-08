# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

for i in 1..48
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"

  user = User.new
  user.first_name = first_name
  user.last_name = last_name
  user.email = Faker::Internet.free_email(name)
  user.street_address = Faker::Address.street_address
  user.city = Faker::Address.city
  user.province = Faker::Address.state
  user.postal_code = Faker::Address.postcode
  user.country = Faker::Address.country

  if user.save
    for ii in 1..48
      micropost = Micropost.new
      micropost.user = user
      micropost.message = Faker::Lorem.paragraph
      micropost.save
    end
  end
end