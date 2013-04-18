class Project < ActiveRecord::Base
  attr_accessible :user_id, :name
  
  belongs_to :user
  has_many :tasks
  
  scope :with_status, lambda { |status| includes(:tasks).where("tasks.status='#{status}'")}
  
  def tasks_count(status=nil)
    unless status.nil?
      tasks.where(:status => status).count
    else
      tasks.count
    end
  end
end
