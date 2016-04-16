module MessagesHelper
	# Define class used in CSS
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end
  # Gets the user associated with a message 
  def message_interlocutor(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end
