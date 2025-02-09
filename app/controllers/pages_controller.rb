class PagesController < ApplicationController
  def home
    @articles = Article.all
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: "Article added successfully!"
    else
      @articles = Article.all # Re-fetch articles to avoid breaking the view
      render :index
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :author_name)
  end
end
