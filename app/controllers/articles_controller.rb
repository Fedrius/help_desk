# camel case, plural, uppercased
class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params) # creates the new article and saves
    @article.save
    redirect_to articles_show(@article)
  end
  
  # defining articles params here
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end