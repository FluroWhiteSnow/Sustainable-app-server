class UserDailyController < ApplicationController
    before_action :authenticate_user
    before_action :set_daily, only: [:update, :destroy]

    def index
        if current_user.admin == true
            @all_dailies = UserDaily.all 
        else 
           @all_dailies = current_user.user_dailies.all
        end
        render json: @all_dailies
    end

    def create
        @new_user_daily = current_user.user_dailies.create(user_daily_params)
        if @new_user_daily.errors.any?
            render json: @new_user_daily.errors, status: :unprocessable_entity
        else
            render json: @new_user_daily, status: 201
        end
    end

    def update
        @user_daily.update_total_cups_table(user_daily_params)
        @user_daily.update_total_travel_table(user_daily_params)
        @user_daily.update(user_daily_params)
        if @user_daily.errors.any? 
            render json: @user_daily.errors, status: :unprocessable_entity
        else 
            render json: @user_daily, status: 201
        end
    end

    def destroy
        @user_daily.destroy
    end

    private

    def set_daily
        @user_daily = UserDaily.find(params[:id])
    end

    def user_daily_params 
        params.require(:user_daily).permit(:walk, :public_transport, :drive, :reusable_cups, :coffee_cups, :user_id, :travel_total_id, :cups_total_id)
    end
end
