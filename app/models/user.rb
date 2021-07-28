class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :distance_from_work, presence: true

    has_many :user_dailies
    has_one :cups_total 
    has_one :user_co2_total
    has_one :travel_total

    after_create :user_total_tables

    def user_total_tables
        id = self.id 

        UserCo2Total.create(user_id: id, walk_co2_total: 0, pt_co2_total: 0, drive_co2_total: 0, coffee_cups_co2_total: 0, reusable_cups_co2_total: 0)
        CupsTotal.create(user_id: id, coffee_cups_total: 0, reusable_cups_total: 0)
        TravelTotal.create(user_id: id, walk_total_km: 0, pt_total_km: 0, drive_total_km: 0)
    end

end