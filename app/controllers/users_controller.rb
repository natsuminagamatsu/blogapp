class UsersController < ApplicationController
  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    user.save
    redirect_to articles_url
  end

  def show
    @user = User.find(params[:id])
  end
end
