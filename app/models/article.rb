class Article < ApplicationRecord
  has_many :comments
  has_many :favorite
  belongs_to :user
end
