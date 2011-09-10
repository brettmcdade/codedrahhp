class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  # Redirect to current user path on sign in
  def after_sign_in_path_for(resource_or_scope)
    user_path(current_user)
  end
  
  def param_posted?(sym)
  	request.post? and params[sym]
  end
end
