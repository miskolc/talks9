class CommentsController < ApplicationController  
  def index
    @comments = Comment.order('created_at ASC').all
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    
    if @comment.save
      redirect_to comments_path, :notice => "Comment created"
    else
      redirect_to comments_path, :error => "There was an error"
    end
  end
end
