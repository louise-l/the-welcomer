# To deliver this notification:
#
# HelpNotification.with(post: @post).deliver_later(current_user)
# HelpNotification.with(post: @post).deliver(current_user)

class HelpNotification < Noticed::Base
  # Add your delivery methods  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :mission_change

  def to_database
    {
      notifiable: params[:mission_change],
      type: self.class.name,
      params: params,
    }
  end

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message", name: params[:mission_change].user.first_name, status: params[:mission_change].status, mission: params[:mission_change].name)
  end

  def url
    company_edit_notification_path(params[:mission_change].user.company.name, @record)
  end

  def url_bis
    company_dashboard_path(params[:mission_change].user.company.name, params[:mission_change].user)
  end
end
