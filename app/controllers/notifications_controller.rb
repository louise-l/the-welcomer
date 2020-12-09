class NotificationsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @notifications = current_user.notifications
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.seen = true
    @notification.save
    # redirect_to company_meeting_path(current_user.company.name, params[:id])
    redirect_to @notification.to_notification.url_bis
  end

  def change_message
    @notifications = Notification.where(type: "MessageNotification")
    @notifications.each do |notif|
      notif.seen = true
      notif.save
    end
    redirect_to company_conversations_path(current_user.company.name)
  end
end
