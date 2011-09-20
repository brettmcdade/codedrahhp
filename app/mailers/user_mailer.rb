class UserMailer < ActionMailer::Base
  default :from => "brettmcdade@gmail.com"
  
  def file_upload_confirmation(user, mediafile)  
  	@user = user
  	@mediafile = mediafile
    mail(:to => user.email, :subject => "File Uploaded Successfully")  
  end  
end
