class CommentsController < ApplicationController
  def create
    comment = @current_user.comments.build(contents: params[:input_comment], article_id: params[:article_id])
    comment.save
    redirect_to article_url(params[:article_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to article_url(params[:article_id])
  end

  def index
    @comments = Comment.order("created_at DESC")
  end
end
