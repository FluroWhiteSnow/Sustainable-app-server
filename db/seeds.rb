# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#ApplicationRecord
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(first_name: "Bob", last_name: "Smith", username: "Bob1", password: "test123", password_confirmation: "test123", email: "bob@gmail.com", department_code: "Finance", admin: true, distance_from_work: 5)
    User.create(first_name: "George", last_name: "Homes", username: "George1", password: "test123", password_confirmation: "test123", email: "georgehomes@gmail.com", department_code: "IT", admin: true, distance_from_work: 30)
    User.create(first_name: "Harrold", last_name: "Sanders", username: "Harrold1", password: "test123", password_confirmation: "test123", email: "harrold@gmail.com", department_code: "Accounting", admin: true, distance_from_work: 20)
    User.create(first_name: "Kevin", last_name: "Brock", username: "Kevin1", password: "test123", password_confirmation: "test123", email: "kevin@gmail.com", department_code: "Finance", admin: true, distance_from_work: 30)
    User.create(first_name: "Andrew", last_name: "Yorken", username: "Andrew1", password: "test123", password_confirmation: "test123", email: "andrew@gmail.com", department_code: "IT", admin: true, distance_from_work: 24)
    User.create(first_name: "Jordan", last_name: "Brathey", username: "Jordan1", password: "test123", password_confirmation: "test123", email: "jordan@gmail.com", department_code: "Accounting", admin: true, distance_from_work: 18)
end

if UserDaily.count == 0
    5.times {
        random_coffee = rand(1..5)
        random_reusable = (random_coffee * rand()).round 
        UserDaily.create(user_id: 1, walk: true, public_transport: false, drive: false, coffee_cups: random_coffee, reusable_cups: random_reusable, cups_total_id: 1, travel_total_id: 1)
        UserDaily.create(user_id: 2, walk: false, public_transport: true, drive: false, coffee_cups: random_coffee, reusable_cups: random_reusable, cups_total_id: 2, travel_total_id: 2)
        UserDaily.create(user_id: 3, walk: false, public_transport: true, drive: false, coffee_cups: random_coffee, reusable_cups: random_reusable, cups_total_id: 3, travel_total_id: 3)
        UserDaily.create(user_id: 4, walk: true, public_transport: false, drive: false, coffee_cups: random_coffee, reusable_cups: random_reusable, cups_total_id: 4, travel_total_id: 4)
        UserDaily.create(user_id: 5, walk: false, public_transport: true, drive: false, coffee_cups: random_coffee, reusable_cups: random_reusable, cups_total_id: 5, travel_total_id: 5)
        UserDaily.create(user_id: 6, walk: false, public_transport: false, drive: true, coffee_cups: random_coffee, reusable_cups: random_reusable, cups_total_id: 6, travel_total_id: 6)
    }
end