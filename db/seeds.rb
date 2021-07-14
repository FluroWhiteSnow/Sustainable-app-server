# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#ApplicationRecord
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(first_name: "Ananda", last_name: "Rodziewicz", username: "Ananda1", password: "test123", password_confirmation: "test123", email: "anrodziewiczz@gmail.com", department_code: "Finance", admin: false)
    User.create(first_name: "Jackie", last_name: "Sun", username: "Jackie1", password: "test123", password_confirmation: "test123", email: "jackiesun@gmail.com", department_code: "IT", admin: false)
    User.create(first_name: "Harrold", last_name: "Sanders", username: "Harrold1", password: "test123", password_confirmation: "test123", email: "harrold@gmail.com", department_code: "Accounting", admin: false)
end




if UserDaily.count == 0
    UserDaily.create(user_id: 1, walk: true, public_transport: false, drive: false, coffee_cups: 5, reusible_cups: 0)
    UserDaily.create(user_id: 2, walk: false, public_transport: true, drive: false, coffee_cups: 2, reusible_cups: 3)
    UserDaily.create(user_id: 3, walk: false, public_transport: false, drive: true, coffee_cups: 0, reusible_cups: 8)
end

