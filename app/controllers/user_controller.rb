class UserController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.errors.any?
            render json: @user.errors, status: :unprocessasble_entity
        else
            render json: @user, status: 201
        end
    end

    def show
        render json: @user
    end

    def update
        @user.update(user_params)
        if @user.errors.any? 
            render json: @user.errors, status: :unprocessasble_entity
        else
            render json: @user, status: 201
        end
    end

    private

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :username, :password_digest, :distance_from_work, :email, :department_code, :admin)
    end

end
