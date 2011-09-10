class ProfileController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
  
    @title = "Edit Profile"
	@user = current_user
	@user.profile ||= Profile.new
	@profile = @user.profile
	
	if param_posted?(:profile)
		if @user.profile.update_attributes(params[:profile])
			flash[:notice] = "Changes saved"
			redirect_to @user
		else
			flash[:notice] = "Changes were not saved"	
		end
  	end
  end

end
