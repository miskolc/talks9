class ChallengesController < ApplicationController
  def challenge_two
  end
  
  def challenge_two_action
    @like = Like.new(params[:like])
    @like.user = current_user
    
    if @like.save
      redirect_to challenge_two_path, :notice => "Page liked!"
    else
      redirect_to challenge_two_path, :error => "There was an error!"
    end
  end
  
  def hack2
    
  end
  
  def challenge_three
    @user = User.find(params[:id])
  end
  
  def challenge_nine
    session[:challenge9] = params[:query]
  end
end
