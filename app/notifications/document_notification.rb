# To deliver this notification:
#
# DocumentNotification.with(post: @post).deliver_later(current_user)
# DocumentNotification.with(post: @post).deliver(current_user)

class DocumentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  param :personal_library

  def to_database
    {
      notifiable: params[:personal_library],
      type: self.class.name,
      params: params,
    }
  end

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message", name: params[:personal_library].user.first_name, letter: params[:personal_library].user.last_name.first.upcase, document: params[:personal_library].label )
  end

  def url
    company_edit_notification_path(params[:personal_library].user.company.name, @record)
  end

  def url_bis
    company_personal_libraries_path(params[:personal_library].user.company.name, params[:personal_library].user_id)
  end
end
