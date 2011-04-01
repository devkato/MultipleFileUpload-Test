class FileController < ApplicationController
  def index
    @upload_files = UploadFile.page(params[:page])
    respond_to do |format|
      format.html {
        render :jquery
      }
      format.js {
        render :action => :delete
      }
    end
  end

  def delete
    @upload_file = UploadFile.find(params[:id])

    respond_to do |format|
      if @upload_file.destroy
        format.html { redirect_to :action => :index }
        format.js  {
          @upload_files = UploadFile.page(params[:page])
        }
      else
        format.html { redirect_to :action => :index }
        format.js  {}
      end
    end
  end

  def upload

    @upload_file = UploadFile.new(:file => params[:file])

    if @upload_file.save
      res = {
        'name' => @upload_file.file.name,
        'type' => @upload_file.file.content_type,
        'size' => @upload_file.file.size
      }
    else
      res = {'error' => ''}
    end

    render :json => res.to_json
  end

end
