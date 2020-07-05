class DestinationsController < ApplicationController
    
    def index
        @destinations = Destination.all
    end


    def show
        @destination = Destination.find(params[:id])
        @five_posts = @destination.five_posts
    end

    

    def destination_params
        params.require(:destination).permit(:name, :country)
    end    
end