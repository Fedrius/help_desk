class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page], per_page: 1)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "welcome to alpha #{@user.username}"
      redirect_to articles_path
    else
      # refreshes the 'new' route page
      render 'new'
    end
  end
  
  # passing in 'id' so the route knows which user to edit
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  
  def show
    @user = User.find(params[:id])
    
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 1)
  end
  
  
  # whitelist the input
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
  
end