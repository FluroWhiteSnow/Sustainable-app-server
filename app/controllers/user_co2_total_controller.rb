class UserCo2TotalController < ApplicationController
    before_action :authenticate_user

    def index
        @user_co2_total = current_user.user_co2_total
        render json: @user_co2_total
    end

    def index_all
        @user_co2_total = UserCo2Total.all
        render json: @user_co2_total
    end
end