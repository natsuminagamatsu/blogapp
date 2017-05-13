class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :assign_user

  private

  def assign_user
    @current_user = User.find(session[:user_id]) if session.has_key? :user_id
  end
end
