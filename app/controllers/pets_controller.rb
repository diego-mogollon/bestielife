class PetsController < ApplicationController
    def show
        @pet = Pet.find(params[:id])
    end
    def add_picture
        @pet = Pet.find(params[:id])
        @pet.photos.attach(io: params[:pet][:photo], filename: "#{@pet.id}_picture", content_type: 'image/png')
        redirect_to @pet
    end
    def remove_picture
        @photo = ActiveStorage::Attachment.find(params[:id])
        @photo.purge
        redirect_to pet_path(@photo.record_id)
    end
end
