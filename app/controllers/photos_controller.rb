class PhotosController < ApplicationController
  def show
    @photo = ActiveStorage::Attachment.find(params[:id])  
  end
end
