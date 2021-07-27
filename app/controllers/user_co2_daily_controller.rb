class UserCo2DailyController < ApplicationController
    before_action :authenticate_user

    def index
        @user_co2_daily = UserCo2Daily.where(user_co2_total: current_user.user_co2_total)
        render json: @user_co2_daily
    end

    def index_all
        @user_co2_daily = UserCo2Daily.all 
        render json: @user_co2_daily
    end

end
