# To deliver this notification:
#
# NewProfileNotification.with(post: @post).deliver_later(current_user)
# NewProfileNotification.with(post: @post).deliver(current_user)

class NewProfileNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  def to_database
    {
      notifiable: params[:notif_user],
      type: self.class.name,
      params: params,
    }
  end

  param :notif_user

  def message
    t(".message", name: params[:notif_user].first_name)
  end

  def url
    company_edit_notification_path(params[:notif_user].company.name, @record)
  end

  def url_bis
    company_team_path(params[:notif_user].company.name, params[:notif_user].team)
  end
end
