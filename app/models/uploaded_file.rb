class UploadedFile < ActiveRecord::Base
  attr_accessible :file_name
  
  UPLOADS_DIR = File.join(Rails.root.to_s, "public", "uploads")
  
  before_update :move_file
  
  #before_validation :sanitize_file_name
  
  def move_file
    unless self.file_name_was == self.file_name || self.file_name.nil?
      old_file = File.join(UPLOADS_DIR, self.file_name_was)
      new_file = File.join(UPLOADS_DIR, self.file_name)
      FileUtils::mv(old_file, new_file)
    end
  end
  
  def sanitize_file_name
    self.file_name = File.basename(self.file_name).gsub(/[^\w\.\_]/, '_')
  end
end
