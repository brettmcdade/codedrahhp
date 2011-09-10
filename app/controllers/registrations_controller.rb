class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def new
    super
  end
  
  def create
    @user = User.new(params[:user])
	@user.build_profile
	
    if @user.save
      flash[:notice] = "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
      sign_in_and_redirect(:user, @user)
    else
      render :action => :new
    end
  end
  
  
  # Added to override update without having to confirm password
  def update
    # Override Devise to use update_attributes instead of update_with_password.
    # This is the only change we make.
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      # Line below required if using Devise >= 1.2.0
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end
  
  


end
