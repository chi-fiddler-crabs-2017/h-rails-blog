class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroty #if post deleted then comment will be deleted

  validates :title, presence: true, length: { minimum: 5}
  validates :body, presence: true
end
