class UsersController < ApplicationController
  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    user.save
    redirect_to articles_url
  end

  def update
    @current_user.update_attributes(user_params)

    if params[:user].has_key? :pictures
      save_photo params[:user][:pictures]
      @current_user.update_attribute(:has_photo, true)
    end

    redirect_to articles_url
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :bio)
  end

  def photo_path #ファイルへのパスを作る
    Rails.root.join('public', 'uploads', photo_filename)
  end

  def photo_filename #ファイル名を作る
    "#{@current_user.id}.jpg"
  end

  def save_photo(uploaded_file) #保存する関数
    File.open(photo_path, 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end
end
