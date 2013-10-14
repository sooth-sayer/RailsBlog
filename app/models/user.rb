class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :posts, :dependent => :destroy

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates_email_format_of :email

  has_secure_password
  validates :password, length: { minimum: 3 }
end
