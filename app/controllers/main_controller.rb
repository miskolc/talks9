class MainController < ApplicationController
  before_filter :authenticate_user!, :except => 'auth'
  
  def auth
  end
  
  def dashboard
    if params[:status]
      @projects = Project.with_status(params[:status])
    else
      @projects = Project.all
    end
  end
end
