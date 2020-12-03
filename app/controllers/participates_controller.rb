class ParticipatesController < ApplicationController
	skip_after_action :verify_authorized, only: [:index, :new, :create, :edit, :update, :destroy, :show]
	skip_after_action :verify_policy_scoped, :only => [:index, :new, :create, :edit, :update, :destroy, :show]

	def create
		@fullname = params[:name][:participate]
		@meeting = Meeting.find(params[:meeting_id])
		@meeting_participates = Participate.where(meeting: @meeting).map{ |participate| participate.user }
		if @fullname.size == 2
			@fullname = @fullname[1]
			@index_user = current_user.company.full_name.index{ |fullname| fullname == @fullname}
			@user = current_user.company.users[@index_user]
			if @meeting_participates.include?(@user)
				flash[:alert] = "#{@fullname} est déjà inscrit dans la réunion"
				redirect_to company_meeting_path(current_user.company.name, @meeting)
			else
				@participate = Participate.create(user: @user, meeting: @meeting, owner: false)
				redirect_to company_meeting_path(current_user.company.name, @meeting)
			end
		else
			@fullnames = @fullname.drop(1)
			@index_user = []
			@fullnames.each { |fullname| @index_user << current_user.company.full_name.index{ |fullname_user| fullname_user == fullname} }
			@users = @index_user.map {|index| current_user.company.users[index]}
			@users.each do |user|
				if @meeting_participates.include?(user)
					flash[:alert] = "Un ou plusieurs utilisateurs étaient déjà inscrits."
				else
					@participate = Participate.create(user: user, meeting: @meeting, owner: false)
				end
			end
			redirect_to company_meeting_path(current_user.company.name, @meeting)
		end
	end

	def destroy
		@participate = Participate.find(params[:id])
		@meeting = @participate.meeting
		@participate.destroy

		redirect_to company_meeting_path(current_user.company.name, @meeting)
	end

	private

	def participate_params
		params.require(:name).permit(:participant)
	end

end
