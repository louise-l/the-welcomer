# To deliver this notification:
#
# ValidateDocNotification.with(post: @post).deliver_later(current_user)
# ValidateDocNotification.with(post: @post).deliver(current_user)

class ValidateDocNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  param :validate_doc

  def to_database
    {
      notifiable: params[:validate_doc],
      type: self.class.name,
      params: params,
    }
  end

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message", status: params[:validate_doc].status.downcase)
  end

  def url
    company_edit_notification_path(params[:validate_doc].user.company.name, @record)
  end

  def url_bis
    company_personal_libraries_path(params[:validate_doc].user.company.name, params[:validate_doc].user_id)
  end
end
