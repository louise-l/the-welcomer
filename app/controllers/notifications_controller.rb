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
    @conversation = Conversation.find(params[:id])
    @sender_id = @conversation.with(current_user).id
    @notifications = Notification.where(type: "MessageNotification").select { |notif| notif.params[:message].user_id == @sender_id }
    @notifications.each do |notif|
      notif.seen = true
      notif.save
    end
    redirect_to company_conversation_path(current_user.company.name, @conversation, anchor: "message-#{@conversation.messages.size}")
  end
end
