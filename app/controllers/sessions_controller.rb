class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # setting session storage to user id
      session[:user_id] = user.id
      
      flash[:success] = "you have successfully logged in"
      
      redirect_to user_path(user)
    else
      # using .now because render new is not a new request
      flash.now[:danger] = "there was something wrong with your login info"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
  
end