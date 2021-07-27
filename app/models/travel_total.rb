class TravelTotal < ApplicationRecord
    has_many :user_dailies
    belongs_to :user
end

