class PlacesController < ApplicationController
    def index
        @place = Place.new
    end

    def new

    end

    def create
        
    end

    def coordinates_params
        params.require(:place).permit(:lat, :lng)
    end
end
