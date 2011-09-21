class MediafilesController < ApplicationController
	
  before_filter :get_user
  before_filter :authenticate_user!, :except => [:show]
	
  def index
    #@mediafiles = Mediafile.all
    @mediafiles = @user.mediafiles.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mediafiles }
    end
  end

  def show	 
    @mediafile = @user.mediafiles.find_by_uuid(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mediafile }
    end
  end

  def new
    @mediafile = @user.mediafiles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mediafile }
    end
  end


  def create
    @mediafile = @user.mediafiles.create(params[:mediafile])
    
    respond_to do |format|
      if @mediafile.save
      	UserMailer.file_upload_confirmation(@user, @mediafile).deliver  
		format.html { redirect_to current_user, notice: 'Uploaded Succesfully. You will receive an email shortly' }
       # format.html { redirect_to ([ @user, @mediafile]), notice: 'Mediafile was successfully created.' }
        format.json { render json: @mediafile, status: :created, location: @mediafile }
      else
        format.html { render action: "new" }
        format.json { render json: @mediafile.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy    
    @mediafile = @user.mediafiles.find(params[:id])
    @mediafile.destroy

    respond_to do |format|
      format.html { redirect_to ([ @user, @mediafile]), notice: 'Mediafile was successfully deleted.' }
      format.json { head :ok }
    end
  end
  
  
def download
  head(:not_found) and return if (mediafile = Mediafile.find_by_uuid(params[:uuid])).nil?
  head(:forbidden) and return unless mediafile.downloadable?(current_user)

  path = mediafile.mp3.path(params[:basename])
  head(:bad_request) and return unless params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

  redirect_to(mediafile.authenticated_url(params[:style]))
end
  
  def get_user
    @user = User.find(params[:user_id])
   # redirect_to root_path unless current_user
  end
  
end
