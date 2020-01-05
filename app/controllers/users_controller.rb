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
        render json: user
        # if user.valid?
        #     session[:user_id] = user.id 
        #     render json: user
        # else
        #     render json: { errors: user.errors.full_messages }
        # end
    end

    # def profile
    #     render json: logged_in
    # end

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
        params.require(:user).permit(:username, :score, :favorite_food)
    end

end

# If Auth is working, I will implement this method.
# def create 
#         user = User.create(user_params)
    
#         if user.valid?
#             # session[:user_id] = user.id 
#             render json: { token: encode_token(user) }
#         else
#             render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
#         end
# end

#  def user_params
#         params.permit(:username, :score, :favorite_food, :password)
#     end