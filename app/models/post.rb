class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  #@post.commentsで引っ張ってくることが可能になる
  validates :title, presence: true, length: { minimum: 3, message: '短すぎるよ'}
  validates :body, presence: true
end
