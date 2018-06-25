# camel case, plural, uppercased
class ArticlesController < ApplicationController
  # only these 4 methods will call set_article which is @article = Article.find(params[:id])
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    #instance variable can be anything. 'articles' in easier right now. use this variable in embedded ruby in html.erb files
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create

    # render plain: params[:article].inspect
    @article = Article.new(article_params) # creates the new article and saves
    
    @article.user = User.first
    
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
    if @article.update(article_params)
      flash[:notice] = "article updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  #renders show.html, able to use a specific article object in it.
  def show
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed"
    redirect_to articles_path
  end
  
  # defining articles params here. whitelisting
  private
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      # from params hash, allow title and description.
      params.require(:article).permit(:title, :description)
    end

end