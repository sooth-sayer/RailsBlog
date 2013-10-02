class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }
  mount_uploader :picture, PictureUploader
end
