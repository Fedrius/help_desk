class PagesController < ApplicationController
  
  def home
    # if user is logged in.,, redirect user if they accress the root route
    redirect_to articles_path if logged_in?
    
  end
  
  def about
    
  end
  
end