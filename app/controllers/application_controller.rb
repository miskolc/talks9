class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate_user!
    if current_user.nil?
      redirect_to auth_path
    end
  end
end
