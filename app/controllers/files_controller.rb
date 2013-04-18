class FilesController < ApplicationController
  before_filter :setup_file, :only => [:edit, :update]
  
  def index
    @files = UploadedFile.all
  end
  
  def edit

  end
  
  def update
    if @file.update_attributes(params[:uploaded_file])
      redirect_to files_path, :notice => "File renamed"
    else
      redirect_to files_path, :notice => "There was an error"
    end
  end
  
  private
    def setup_file
      @file = UploadedFile.find(params[:id])
    end
end
