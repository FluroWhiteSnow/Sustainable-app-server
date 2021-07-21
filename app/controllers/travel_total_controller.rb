class TravelTotalController < ApplicationController
    before_action :authenticate_user

    def index
        if current_user.admin == true 
            @travel_total = TravelTotal.all
        else
            @travel_total = current_user.travel_total
        end
        render json: @travel_total
    end
end
