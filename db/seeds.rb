# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


users = FactoryBot.create_list(:user, 100)
users.each do |user|
    FactoryBot.create_list(:food, rand(15..25), user: user)
    FactoryBot.create_list(:shopping, rand(1..5), user: user)
    FactoryBot.create_list(:culture, rand(1..5), user: user)
    FactoryBot.create_list(:education, rand(0..2), user: user)
    FactoryBot.create_list(:earning_detail, rand(1..2), user: user)
end
