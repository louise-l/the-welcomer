# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  def to_database
    {
      notifiable: params[:message],
      type: self.class.name,
      params: params,
    }
  end
  # Add required params
  #
  param :message

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end
  #
  def url
    company_edit_notification_path(params[:message].user.company.name, @record)
  end

  def url_bis
    #à penser
  end
end
