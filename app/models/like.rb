class Like < ActiveRecord::Base
  attr_accessible :page_id
  
  belongs_to :user
end
