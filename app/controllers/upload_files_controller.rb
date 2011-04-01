class UploadFilesController < ApplicationController
  # GET /upload_files
  # GET /upload_files.xml
  def index
    @upload_files = UploadFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @upload_files }
    end
  end

  # GET /upload_files/1
  # GET /upload_files/1.xml
  def show
    @upload_file = UploadFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload_file }
    end
  end

  # GET /upload_files/new
  # GET /upload_files/new.xml
  def new
    @upload_file = UploadFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload_file }
    end
  end

  # GET /upload_files/1/edit
  def edit
    @upload_file = UploadFile.find(params[:id])
  end

  # POST /upload_files
  # POST /upload_files.xml
  def create
    @upload_file = UploadFile.new(params[:upload_file])

    respond_to do |format|
      if @upload_file.save
        format.html { redirect_to(@upload_file, :notice => 'Upload file was successfully created.') }
        format.xml  { render :xml => @upload_file, :status => :created, :location => @upload_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @upload_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /upload_files/1
  # PUT /upload_files/1.xml
  def update
    @upload_file = UploadFile.find(params[:id])

    respond_to do |format|
      if @upload_file.update_attributes(params[:upload_file])
        format.html { redirect_to(@upload_file, :notice => 'Upload file was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @upload_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_files/1
  # DELETE /upload_files/1.xml
  def destroy
    @upload_file = UploadFile.find(params[:id])
    @upload_file.destroy

    respond_to do |format|
      format.html { redirect_to(upload_files_url) }
      format.xml  { head :ok }
    end
  end
end
