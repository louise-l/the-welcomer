class ConversationsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  before_action :set_conversation, except: [:index, :window]
  before_action :check_participating!, except: [:index, :window]

  def index
    @conversations = Conversation.participating(current_user).order("updated_at DESC")
    @users = User.where(company: current_user.company)
  end

  def show
    @message = Message.new
  end

  def window
    @message = Message.new
    @user_id = current_user.id
    @receiver_fullname = params[:name].split(" ")
    @receiver_last_name = @receiver_fullname[1]
    @receiver_first_name = @receiver_fullname[0]
    @receiver_id = current_user.company.users.where(first_name: @receiver_first_name, last_name: @receiver_last_name)[0].id
    @conversations = Conversation.participating(current_user)
    @conversation1 = @conversations.where(author_id: @receiver_id)[0]
    @conversation2 = @conversations.where(receiver_id: @receiver_id)[0]
    if @conversation1 || @conversation2
      @conversation1 ? (@conversation = @conversation1) : (@conversation = @conversation2)
    else
      @conversation = Conversation.new(author_id: current_user.id, receiver_id: @receiver_id)
      @conversation.save
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to company_conversations_path(current_user.company.name) unless @conversation && @conversation.participates?(current_user)
  end
end
