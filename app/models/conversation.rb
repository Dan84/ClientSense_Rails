class Conversation < ActiveRecord::Base
  # Need to specify foreign keys as instance of 'User' 
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy

  # Ensure that sender id and recipient id are unique in order for conversations to be unique
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  # Scope to retrieve the conversations of the current user
  scope :involving, -> (user) do
    where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end
  # Scope to check if a conversation exists between 2 users before a new conversation is set up
  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

end
