class UserDailyController < ApplicationController
    
    def create
        @user_daily = UserDaily.create(user_daily_params)
        if @user_daily.errors.any?
            render json: @user_daily.errors, status: :unprocessasble_entity
        else
            render json: @user_daily, status: 201
        end
    end

    def show
        render json: @user_daily
    end

    def update
        @user_daily.update(user_params)
        if @user_daily.errors.any? 
            render json: @user_daily.errors, status: :unprocessasble_entity
        else
            render json: @user_daily, status: 201
        end
    end

    private

    def user_daily_params 
        params.require(:user_daily).permit(:walk, :public_transport, :drive, :reusable_cups, :coffee_cups, :user_id, :travel_total_id, :cups_total_id)
    end
end
