class TravelTotalController < ApplicationController
    before_action :authenticate_user

    def index
        @travel_total = current_user.travel_total
        render json: @travel_total
    end

    def index_all
        @travel_total = TravelTotal.all
        render json: @travel_total
    end
end
