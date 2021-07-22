class UserCo2TotalController < ApplicationController
    before_action :authenticate_user

    def index
        if current_user.admin == true
            @user_co2_total = UserCo2Total.all
        else
            @user_co2_total = current_user.user_co2_total
        end
            render json: @user_co2_total
    end
end