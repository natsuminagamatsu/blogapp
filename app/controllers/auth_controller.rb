class AuthController < ApplicationController
  before_action :prepare

  def create
    @email = params[:email]

    # EmailアドレスでUserを検索
    # ユーザが見つかれば、そのパスワードと入力されたパスワードが
    # 一致しているか確認する
    user = User.find_by(email: @email)

    if user == nil
      @error_messages.push "Eメールアドレスがありません"
      render "new" # 描画するビューを手動で指定
      return
    end

    unless user.password == params[:password]
      @error_messages.push "パスワードが違います"
      render "new"
      return
    end

    session[:user_id] = user.id

    redirect_to articles_url
  end

  def destroy
    session.delete :user_id
    redirect_to articles_url
  end


  private

  def prepare
    @error_messages = []
  end
end
