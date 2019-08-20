class UsersController < ApplicationController

    def index 
        users = User.all 
        render json: users 
    end

    def show 
        user = User.find(params[:id])
        render json: user, :include => :restaurants
    end

    def new 
        user = User.new 
        render json: user
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id 
            render json: user 
        else
            render json: { errors: user.errors.full_messages }
        end
    end

    def edit
        user = User.find(params[:id])
        render json: user 
    end

    def update
        user = User.find(params[:id])
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy 
        render json: user
    end

    private 

    def user_params
        params.require(:user).permit(:username, :score, :favorite_food, :password)
    end

end
