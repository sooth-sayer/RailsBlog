class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :comments, allow_destroy: true, :reject_if => :all_blank

  validates :title, presence: true, length: { minimum: 3 }

  mount_uploader :picture, PictureUploader

  state_machine :initial => :unpublished do
    state :unpublished
    state :published

    event :publish do
      transition :unpublished => :published
    end
  end

  include PostRepository
end
