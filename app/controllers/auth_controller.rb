class AuthController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          flash[:message] = "Logging in #{@user.name}."
          session[:user_id] = @user.id
          render json: @user
        else
          flash[:message] = "Invalid Username or Password."
          render json: @user
        end
    end

    def destroy
        session[:user_id] = nil
        render json: @user 
    end

end
