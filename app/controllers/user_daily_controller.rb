class UserDailyController < ApplicationController
    before_action :authenticate_user

    def index
        if current_user.admin == true
            @user_daily = UserDaily.all 
        else 
           @user_daily = current_user.user_dailies.all
        end
        render json: @user_daily
    end

    def create
        @user_daily = current_user.user_dailies.create(user_daily_params)
        if @user_daily.errors.any?
            render json: @user_daily.errors, status: :unprocessable_entity
        else
            render json: @user_daily, status: 201
        end
    end

    # def update
    #     @user_daily.update(user_params)
    #     if @user_daily.errors.any? 
    #         render json: @user_daily.errors, status: :unprocessable_entity
    #     else 
    #         render json: @user_daily, status: 201
    #     end
    # end

    private

    def user_daily_params 
        params.require(:user_daily).permit(:walk, :public_transport, :drive, :reusable_cups, :coffee_cups, :user_id, :travel_total_id, :cups_total_id)
    end
end
