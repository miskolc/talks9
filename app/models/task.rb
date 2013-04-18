class Task < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :title, :project_id, :status
end
