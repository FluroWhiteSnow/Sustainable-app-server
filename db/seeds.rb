# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#ApplicationRecord
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(first_name: "Ananda", last_name: "Rodziewicz", username: "Ananda1", password_digest: "test123", email: "anrodziewiczz@gmail.com", department_code: "Finance", admin: false, distance_from_work: 5)
    User.create(first_name: "Jackie", last_name: "Sun", username: "Jackie1", password_digest: "test123", email: "jackiesun@gmail.com", department_code: "IT", admin: false, distance_from_work: 30)
    User.create(first_name: "Harrold", last_name: "Sanders", username: "Harrold1", password_digest: "test123", email: "harrold@gmail.com", department_code: "Accounting", admin: false, distance_from_work: 20)
end

if CupsTotal.count == 0
    CupsTotal.create(coffee_cups_total: 0, reusable_cups_total: 0)
    CupsTotal.create(coffee_cups_total: 0, reusable_cups_total: 0)
    CupsTotal.create(coffee_cups_total: 0, reusable_cups_total: 0)
    puts "cups total created"
end

if TravelTotal.count == 0 
    TravelTotal.create(walk_total_km: 0, pt_total_km: 0, drive_total_km: 0)
    TravelTotal.create(walk_total_km: 0, pt_total_km: 0, drive_total_km: 0)
    TravelTotal.create(walk_total_km: 0, pt_total_km: 0, drive_total_km: 0)
    puts "travel total created"
end

if UserDaily.count == 0
    UserDaily.create(user_id: 1, walk: true, public_transport: false, drive: false, coffee_cups: 5, reusable_cups: 0, cups_total_id: 1, travel_total_id: 1)
    UserDaily.create(user_id: 2, walk: false, public_transport: true, drive: false, coffee_cups: 2, reusable_cups: 3, cups_total_id: 2, travel_total_id: 2)
    UserDaily.create(user_id: 3, walk: false, public_transport: false, drive: true, coffee_cups: 0, reusable_cups: 8, cups_total_id: 3, travel_total_id: 3)
    UserDaily.create(user_id: 1, walk: false, public_transport: false, drive: true, coffee_cups: 5, reusable_cups: 0, cups_total_id: 1, travel_total_id: 1)
    UserDaily.create(user_id: 2, walk: true, public_transport: false, drive: false, coffee_cups: 2, reusable_cups: 3, cups_total_id: 2, travel_total_id: 2)
    UserDaily.create(user_id: 3, walk: false, public_transport: true, drive: false, coffee_cups: 0, reusable_cups: 8, cups_total_id: 3, travel_total_id: 3)
    puts "user created"
end

if UserCo2Total.count == 0 
    UserCo2Total.create(walk_co2_total: 0, pt_co2_total: 0, drive_co2_total: 0, coffee_cups_co2_total: 0, reusable_cups_co2_total: 0)
    UserCo2Total.create(walk_co2_total: 0, pt_co2_total: 0, drive_co2_total: 0, coffee_cups_co2_total: 0, reusable_cups_co2_total: 0)
    UserCo2Total.create(walk_co2_total: 0, pt_co2_total: 0, drive_co2_total: 0, coffee_cups_co2_total: 0, reusable_cups_co2_total: 0)
    puts "userco2total created"
end

if UserCo2Daily.count == 0
    UserCo2Daily.create(walk_co2: 15, pt_co2: 0, drive_co2: 0, coffee_cups_co2: 0, reusable_cups_co2: 15, user_daily_id: 1, user_co2_daily_total: 30)
    UserCo2Daily.create(walk_co2: 20, pt_co2: 0, drive_co2: 0, coffee_cups_co2: 0, reusable_cups_co2: 15, user_daily_id: 2, user_co2_daily_total: 35)
    UserCo2Daily.create(walk_co2: 0, pt_co2: 30, drive_co2: 0, coffee_cups_co2: 0, reusable_cups_co2: 15, user_daily_id: 3, user_co2_daily_total: 45)
    puts "userco2daily created"
end
