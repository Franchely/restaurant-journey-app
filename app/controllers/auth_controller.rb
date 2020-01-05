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


# If auth is working, I would replace create with 

#       is_authenticated = user.authenticate(params[:password])

#       if is_authenticated
#         user_token = encode_token(user)

#         render json: {user: user.username, token: user_token, user_id: user.id}
#       else 
#         render json: {errors: ["Wrong username or password. Sorry!"]}, status: :unprocessible_entity
#       end
#     end