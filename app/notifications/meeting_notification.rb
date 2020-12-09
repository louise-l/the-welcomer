# To deliver this notification:
# MeetingNotification.with(post: @post).deliver_later(current_user)
# MeetingNotification.with(post: @post).deliver(current_user)

class MeetingNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :meeting

  # Define helper methods to make rendering easier.
  #

  def to_database
    {
      notifiable: params[:meeting],
      type: self.class.name,
      params: params,
    }
  end

  def message
    t('.message', meeting: params[:meeting].start_time.strftime("%d %B %Y"))
  end

  def url
    company_edit_notification_path(params[:meeting].users.first.company.name, @record)
  end

  def url_bis
    company_meeting_path(params[:meeting].users.first.company.name, params[:meeting])
  end
end
