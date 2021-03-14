class PhotosController < ApplicationController
  def new
    @pet = current_user.pet
  end
  
  def show
    @photo = ActiveStorage::Attachment.find(params[:id])  
    @pet = Pet.find(@photo.record_id)
  end
end
