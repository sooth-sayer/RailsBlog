class User < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true
  validates :email, uniqueness: true
  validates_email_format_of :email

  before_save { self.email = email.downcase }
end
