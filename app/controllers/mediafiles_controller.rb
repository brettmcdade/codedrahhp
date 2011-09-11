class MediafilesController < ApplicationController
	
	before_filter :get_user
	
  # GET /mediafiles
  # GET /mediafiles.json
  def index
    #@mediafiles = Mediafile.all
    @mediafiles = @user.mediafiles.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mediafiles }
    end
  end

  # GET /mediafiles/1
  # GET /mediafiles/1.json
  def show	
 # 	@user = User.find(params[:user_id])
 # 	@profile = @user.profile
 #   @mediafile = Mediafile.find_by_uuid(params[:id])
    
    @mediafile = @user.mediafiles.find_by_uuid(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mediafile }
    end
  end

  # GET /mediafiles/new
  # GET /mediafiles/new.json
  def new
   # @mediafile = Mediafile.new
    @mediafile = @user.mediafiles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mediafile }
    end
  end

  # GET /mediafiles/1/edit
  def edit
   # @mediafile = Mediafile.find(params[:id])
    @mediafile = @user.mediafiles.find(params[:id])
  end

  # POST /mediafiles
  # POST /mediafiles.json
  def create
   #@mediafile = current_user.mediafiles.create(params[:mediafile])
    @mediafile = @user.mediafiles.create(params[:mediafile])
    
    respond_to do |format|
      if @mediafile.save
      	format.html { redirect_to ([ @user, @mediafile]), notice: 'Mediafile was successfully created.' }
        format.html { redirect_to @mediafile, notice: 'Mediafile was successfully created.' }
        format.json { render json: @mediafile, status: :created, location: @mediafile }
      else
        format.html { render action: "new" }
        format.json { render json: @mediafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mediafiles/1
  # PUT /mediafiles/1.json
  def update
    # @mediafile = Mediafile.find(params[:id])
    @mediafile = @user.mediafiles.find(params[:id])

    respond_to do |format|
      if @mediafile.update_attributes(params[:mediafile])
        format.html { redirect_to @mediafile, notice: 'Mediafile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mediafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mediafiles/1
  # DELETE /mediafiles/1.json
  def destroy
   # @mediafile = Mediafile.find(params[:id])
    
    @mediafile = @user.mediafiles.find(params[:id])
    @mediafile.destroy

    respond_to do |format|
      format.html { redirect_to mediafiles_url }
      format.json { head :ok }
    end
  end
  
  
def download
  head(:not_found) and return if (mediafile = Mediafile.find_by_uuid(params[:uuid])).nil?
  head(:forbidden) and return unless mediafile.downloadable?(current_user)

  path = mediafile.mp3.path(params[:style])
  head(:bad_request) and return unless params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

  redirect_to(mediafile.authenticated_url(params[:style]))
end
  
  def get_user
    @user = User.find(params[:user_id])
    redirect_to root_path unless current_user
  end
  
end
