class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # helper methods defined here to for controller access AND views access
  helper_method :current_user, :logged_in?
  
  def current_user
    # if there is a current already, do nothing. else find the user in db
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # if no current user, return false. if current user, return true. '!!' to conver to a boolean
    !!current_user
  end
  
  # restricting actions
  def require_user
    # if not logged in, then redirect
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
  
  def admin_restriction
    if !logged_in?
      flash[:danger] = "Restricted Access"
      redirect_to root_path
    elsif !current_user.admin || !logged_in?
      flash[:danger] = "Restricted Access"
      redirect_to root_path
    end
    
  end
  
end
