class FriendsController < ApplicationController
def new
end
def add_friend
    @pet = Pet.find(params[:id])
    current_user.friend_request(@pet.user)
    redirect_to root_path   
end
end
