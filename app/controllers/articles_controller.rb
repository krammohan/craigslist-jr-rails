class ArticlesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles
  end

  def new
    @category = Category.find(params[:category_id])
  end

  def create
  	@category = Category.find(params[:category_id])
  	@article = Article.new(article_params)
  	@article.category_id = @category.id
  	@article.save
  	redirect_to "/categories/#{@category.id}/articles"
  end

  def show
  	@article = Article.find(params[:id])
  	@category = @article.category
  end

  def edit
  	@article = Article.find(params[:id])
  	@category = @article.category
  end

  def update
    @article = Article.find(params[:id])
  	@category = @article.category
    @article.update_attributes(article_params)
    redirect_to "/categories/#{@category.id}/articles/#{@article.id}"
  end

  def destroy
    @article = Article.find(params[:id])
    @category = @article.category
    @article.destroy
    redirect_to "/categories/#{@category.id}/articles"
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

end
