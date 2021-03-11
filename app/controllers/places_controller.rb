require 'open-uri'
require 'json'
require 'rest-client'

class PlacesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @place = Place.new
    end

    def show
        @is_favourite = false
        @location = Place.find_by(google_place_id: params[:id])
        if FavouritePlace.find_by(place_id: @location.id)
            @is_favourite = true
        end
    end

    def check_place
        @location = Place.find_by(google_place_id: params[:id])
        render json:@location
    end

    def add_place
        @place = Place.new(place_details_params)
        if @place.save
            render json:@place
        end 
    end

    private
    def coordinates_params
        params.require(:place).permit(:lat, :lng)
    end

    def place_details_params
        params.require(:place).permit(:address, :name, :photo, :website, :rating, :photo, :google_place_id)
    end
end
