module ApplicationHelper
  def like_count
    Like.all.count
  end
end
