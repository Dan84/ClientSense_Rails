class NotificationsController < ApplicationController
  before_filter :logged_in_user
  before_action :logged_in_user, only: [:read,:edit, :edit,:update]

  def index
    @notifications = Notification.where(recipient: current_user).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

end
