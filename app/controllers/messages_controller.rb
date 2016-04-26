class MessagesController < ApplicationController
  #Some code used from
  #Chatty
  #Joseph-N
  #https://github.com/Joseph-N/chatty
  before_filter :logged_in_user

 def create
    #Conversation is retrieved and accociated messages are created relating to conversation
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    #Passing the path to be used for pub-sub
    @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
