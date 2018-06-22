# camel case, plural, uppercased
class ArticlesController < ApplicationController
  
  def index
    #instance variable can be anything. 'articles' in easier right now. use this variable in embedded ruby in html.erb files
    @articles = Article.all
  end
  
  
  
  def new
    @article = Article.new
  end
  
  
  
  
  def edit
    @article = Article.find(params[:id])
  end
  
  
  
  
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params) # creates the new article and saves
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
      
    #goes into else if the validations have failed.  
    else
      # refreshes page with validation errors essentially
      render 'new'
    end
  end
  
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  
  #renders show.html, able to use a specific article object in it.
  def show
    #article instance variable
    @article = Article.find(params[:id])
  end
  
  
  
  # defining articles params here. whitelisting
  private
  def article_params
    # from params hash, allow title and description.
    params.require(:article).permit(:title, :description)
  end
  
  
end