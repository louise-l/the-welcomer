class ConversationsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
    @conversations = Conversation.participating(current_user).order("updated_at DESC")
    @users = User.where(company: current_user.company)
  end

  def show
    @message = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to company_conversations_path(current_user.company.name) unless @conversation && @conversation.participates?(current_user)
  end
end
