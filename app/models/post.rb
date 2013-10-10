class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }

  mount_uploader :picture, PictureUploader

  state_machine :initial => :created do
    state :created
    state :disabled

    event :close do
      transition :created => :disabled
    end
  end
end
