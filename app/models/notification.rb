class Notification < ActiveRecord::Base
	# Specify notification recipient and actor are instance of 'User'
	belongs_to :recipient, class_name: "User"
  	belongs_to :actor, class_name: "User"
  	# Needs to be polymorphic as notificatin may be anything: appointment, article etc
  	belongs_to :notifiable, polymorphic: true

  
  scope :unread, ->{where(read_at: nil)}
end
