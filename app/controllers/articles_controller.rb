class ArticlesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles
  end

  def new
    @category = Category.find(params[:category_id])
  end

end
