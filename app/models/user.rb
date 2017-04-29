class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :favorites
end
