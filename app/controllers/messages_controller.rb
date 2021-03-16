class MessagesController < ApplicationController
    def create
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = Message.new(message_params) 
        @message.chatroom = @chatroom
        @message.user = current_user
        
        if @message.save
            ChatroomChannel.broadcast_to(
        @chatroom,
        partial: ApplicationController.render(partial: "messages/message", locals: { message: @message, user_is_messages_author: false }),
        sender_id: current_user.id.to_s
      )
        else
            render 'chatrooms/show'
        end
    end
    def message_params
        params.require(:message).permit(:content) 
    end 
end