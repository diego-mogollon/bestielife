class ChatroomsController < ApplicationController
    def index
        @chatrooms = Chatroom.all
        # @chatroom = Chatroom.find(params[:id])
    end
    def show
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
    end
end
