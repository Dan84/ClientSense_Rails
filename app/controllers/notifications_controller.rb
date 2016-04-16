class NotificationsController < ApplicationController
  #Check if user is logged in 
  before_filter :logged_in_user
  before_action :logged_in_user, only: [:read,:edit,:update]

  def index
    #Retrieve the current users unread notifications
    @notifications = Notification.where(recipient: current_user).unread
  end

  #method to mark all unread notifications as read updating with current datetime
  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

end
