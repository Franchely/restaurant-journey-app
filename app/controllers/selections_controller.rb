class SelectionsController < ApplicationController

    def index 
        selections = Selection.all 
        render json: selections 
    end

    def show
        selection = Selection.find(params[:id])
        render json: selection
    end

    def new
        selection = Selection.new
        render json: selection
    end

    def create
        selection = Selection.create(selection_params)
        render json: selection
    end

    private

    def selection_params
        params.require(:selection).permit(:user_id, :restaurant_id, :score)
    end

end
