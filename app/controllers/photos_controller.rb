class PhotosController < ApplicationController
  def show
    @photo = ActiveStorage::Attachment.find(params[:id])  
    @pet = Pet.find(@photo.record_id)
  end
end
