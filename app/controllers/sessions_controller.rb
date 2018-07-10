class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # setting session storage to user id
      session[:user_id] = user.id
      
      flash[:success] = "you have successfully logged in"
      
      if user.admin == true
        redirect_to test_help_desk_path
      else
        redirect_to user_path(user)
      end
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