class ConversationsController < ApplicationController
		#Some code used from
		#Chatty
     	#Joseph-N
     	#https://github.com/Joseph-N/chatty
	 
	before_filter :logged_in_user
	#Set layout to false in order to cancel default views
	layout false

	  def create
	  	#Load previous conversation if exists else create new conversation
	    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
	      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
	    else
	      @conversation = Conversation.create!(conversation_params)
	    end

	    render json: { conversation_id: @conversation.id }
	  end

	  def show
	  	#conversation will also be used for path in pub-sub
	    @conversation = Conversation.find(params[:id])
	    @reciever = interlocutor(@conversation)
	    @messages = @conversation.messages
	    @message = Message.new
	  end

	  def destroy
	    @conversation = Conversation.find(params[:id]).destroy
	    flash[:success] = "conversation deleted"
	    redirect_to users_path
	  end

	  private
	  #converation parameters
	  def conversation_params
	    params.permit(:sender_id, :recipient_id)
	  end
	  #Used to find the receiver of the message, also will be used as the chat window title
	  def interlocutor(conversation)
	    current_user == conversation.recipient ? conversation.sender : conversation.recipient
	  end
end
