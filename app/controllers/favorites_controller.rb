class FavoritesController < ApplicationController
  def create
    favorite = @current_user.favorites.build(article_id: params[:article_id])
    favorite.save
    redirect_to articles_url
  end
end
