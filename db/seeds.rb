# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Image.destroy_all
Tag.destroy_all

User.create(username: "aGuy",
            email: "test@gmail.com",
            password: "password",
            is_female: true,
            date_of_birth: Date.new)
User.create(username: "aChinChilla",
            email: "test2@gmail.com",
            password: "password",
            is_female: true,
            date_of_birth: Date.new)

20.times do
  User.create!(username: Faker::DragonBall.unique.character,
              email: Faker::Internet.email,
              password: "password",
              is_female: true,
              date_of_birth: Date.new)
end

p "Created #{User.count} users"
