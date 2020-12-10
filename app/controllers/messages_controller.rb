class MessagesController < ApplicationController
	skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

	before_action :find_conversation!

	def new
	redirect_to company_conversation_path(current_user.company.name, @conversation) and return if @conversation
		@message = current_user.messages.build
	end

	def create
		@conversation ||= Conversation.create(author_id: current_user.id,
                                        receiver_id: @receiver.id)
		@message = current_user.messages.build(message_params)
		@message.conversation_id = @conversation.id
		if @message.save && @message.content != ""
		ConversationChannel.broadcast_to(
			@conversation,
			render_to_string(partial: "message", locals: { message: @message, user_id: @message.user.id})
		)
			@conversation.updated_at = @message.created_at
			@conversation.save

			flash[:success] = "Your message was sent!"
      @conversation.author_id == current_user.id ? @receiver = User.find(@conversation.receiver_id) : @receiver = User.find(@conversation.author_id)
      MessageNotification.with(message: @message).deliver(@receiver)
			@request = request.referrer
			if @request.include?("window")
				redirect_to request.referrer
			else
				redirect_to company_conversation_path(current_user.company.name, @conversation, anchor: "message-#{@conversation.messages.size}")
			end
		else
			redirect_to request.referrer
			flash[:alert] = "Message cannot be blank"
		end
	end

	private

	def message_params
		params.require(:message).permit(:content)
	end

	def find_conversation!
		if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      redirect_to company_conversations(current_user.company.name) and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    end
	end
end
