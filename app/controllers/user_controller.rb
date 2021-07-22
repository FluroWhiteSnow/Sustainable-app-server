class UserController < ApplicationController
    
    def create
        @user = User.create(user_params)

        if @user.valid? 
            puts Knock::AuthToken
            auth_token = Knock::AuthToken.new(payload: {sub: @user.id})
            render json: {username: @user.username, jwt: auth_token.token}, status: :created
        else 
            puts @user.errors.full_messages
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def sign_in 
        @user = User.find_by_email(params[:email])

        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {username: @user.username, jwt: auth_token.token}, status: 200
        else 
            render json: {error: "Incorrect Email or Password"}, status: 404
        end
    end


    def show
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.errors.any? 
            render json: @user.errors, status: :unprocessasble_entity
        else
            render json: @user, status: 201
        end
    end

    private

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :distance_from_work, :email, :department_code, :admin)
    end

end
