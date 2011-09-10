class DigitalfilesController < ApplicationController
	
	before_filter :get_user
	
  # GET /digitalfiles
  # GET /digitalfiles.json
  def index
  	@profile = current_user
    @digitalfiles = @user.digitalfiles.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @digitalfiles }
    end
  end

  # GET /digitalfiles/1
  # GET /digitalfiles/1.json
  def show
  #	@user = User.find(params[:user_id])
  	@profile = @user.profile
    @digitalfile = @user.digitalfiles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @digitalfile }
    end
  end

  # GET /digitalfiles/new
  # GET /digitalfiles/new.json
  def new
    @digitalfile = @user.digitalfiles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @digitalfile }
    end
  end

  # GET /digitalfiles/1/edit
  def edit
    @digitalfile = @user.digitalfiles.find(params[:id])
  end

  # POST /digitalfiles
  # POST /digitalfiles.json
  def create
      @digitalfile = @user.digitalfiles.create(params[:digitalfile])
      #@digitalfile.token = UUIDTools::UUID.random_create.to_s

    
    # @digitalfile = current_user.digitalfiles.build(params[:digitalfile])
    # @digitalfile.token = UUIDTools::UUID.random_create.to_s
        

    respond_to do |format|
      if @digitalfile.save
        format.html { redirect_to ([ @user, @digitalfile]), notice: 'Digitalfile was successfully created.' }
       # format.html { redirect_to digitalfile_url(@digitalfile, :token => @digitalfile.token) }
        format.json { render json: @digitalfile, status: :created, location: @digitalfile }
      else
        format.html { render action: "new" }
        format.json { render json: @digitalfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /digitalfiles/1
  # PUT /digitalfiles/1.json
  def update
    @digitalfile = @user.digitalfiles.find(params[:id])

    respond_to do |format|
      if @digitalfile.update_attributes(params[:digitalfile])
        format.html { redirect_to @digitalfile, notice: 'Digitalfile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @digitalfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digitalfiles/1
  # DELETE /digitalfiles/1.json
  def destroy
    @digitalfile = @user.digitalfiles.find(params[:id])
    @digitalfile.destroy

    respond_to do |format|
      format.html { redirect_to ([ @user, @digitalfile]) }
      format.json { head :ok }
    end
  end
  
  
  def download
  head(:not_found) and return if (digitalfile = Digitalfile.find_by_id(params[:id])).nil?
  head(:forbidden) and return unless digitalfile.downloadable?(current_user)

  path = digitalfile.mp3.path(params[:style])
  head(:bad_request) and return unless params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

  redirect_to(digitalfile.authenticated_url(params[:style]))
end
  
  def get_user
    @user = User.find(params[:user_id])
    redirect_to root_path unless current_user
  end
  
end
