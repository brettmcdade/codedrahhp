class UsersController < ApplicationController
	
  before_filter :authenticate_user!#, :except => [:index] 

  def show
   @user = User.find_by_username(params[:id])
   #user = User.find(params[:id])
	#@title = @user.username
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
