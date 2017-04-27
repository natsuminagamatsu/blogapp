class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end

  def create
    unless session.has_key? :user_id
      article = Article.new(title: params[:input_title], body: params[:body])
      article.save
    end

    article = @current_user.articles.build(title: params[:input_title], body: params[:body])
    article.save
    redirect_to articles_url
  end

  def destroy
    article = Article.find(params[:id])
    article.delete
    redirect_to articles_url
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.title = params[:title]
    article.body = params[:body]
    article.save
    redirect_to articles_url
  end

  def show
    @article = Article.find(params[:id])
  end
end
