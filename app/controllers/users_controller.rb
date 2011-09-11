class UsersController < ApplicationController
	
  before_filter :authenticate_user!, :except => [:show, :index] 

  def show
   # @user = User.find_by_name(params[:id])
   @user = User.find(params[:id])
#	@user.profile ||= Profile.new
#	@profile = @user.profile
	@title = @user.name
  end
  
  def edit
  
    @title = "Edit Profile"
	@user = current_user
	
	if param_posted?(:user)
		if @user.update_attributes(params[:user])
			flash[:notice] = "Changes saved"
			redirect_to @user
		else
			flash[:notice] = "Changes were not saved"	
		end
  	end
  end

end
