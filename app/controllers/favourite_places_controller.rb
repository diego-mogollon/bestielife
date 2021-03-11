class FavouritePlacesController < ApplicationController
    def index
        @favourites = FavouritePlace.all
    end

    def destroy
        @favourite = FavouritePlace.find(params[:id])
        @favourite.destroy
        redirect_to favourite_places_path
    end

    def add
        @location = Place.find(params[:id])
        @favourite = FavouritePlace.new(place_id: params[:id])
        @favourite.user = current_user
        @favourite.save
        @is_favourite = true
        render template: "places/show"
    end
end
