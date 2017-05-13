class Api::ArticlesController < ApplicationController
  def create
    unless session.has_key? :user_id
      article = Article.new(title: params[:title], body: params[:body])
      article.save
    end

    article = @current_user.articles.build(title: params[:title], body: params[:body])
    article.save
  end

  def index
    @articles = Article.order("created_at DESC")
    render json: @articles
  end
end
