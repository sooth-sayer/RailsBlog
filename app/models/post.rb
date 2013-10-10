class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true, :reject_if => :all_blank

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
