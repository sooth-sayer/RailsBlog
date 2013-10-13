class User < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates_email_format_of :email
  validates :password, length: { minimum: 3 }

  has_secure_password

  before_save { self.email = email.downcase }
end
