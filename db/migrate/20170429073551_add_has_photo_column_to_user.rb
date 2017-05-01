class AddHasPhotoColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :has_photo, :boolean
  end
end
