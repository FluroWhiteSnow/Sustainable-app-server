class UserCo2DailyController < ApplicationController
    before_action :authenticate_user

    def index
        if current_user.admin == true 
            @user_co2_daily = UserCo2Daily.all 
        else
            @user_co2_daily = UserCo2Daily.where(user_co2_total: current_user.user_co2_total)
        end
        render json: @user_co2_daily
    end
end
