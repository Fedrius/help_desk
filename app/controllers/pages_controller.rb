class PagesController < ApplicationController
  
  before_action :admin_restriction, only: [:admin, :help_desk]
  
  def home
    # if user is logged in.,, redirect user if they accress the root route
    redirect_to articles_path if logged_in?
    
  end
  
  def about
    
  end
  
  def help
    
  end
  
  def admin
    
  end
  
  def help_desk
    
  end
  
end