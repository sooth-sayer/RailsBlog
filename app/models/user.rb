class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :posts, :dependent => :destroy

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  # FIXME WTF? validate_email_format_of I18n integration is not working
  validates_email_format_of :email, message: I18n.t(:invalid_email_format, scope: [:errors, :messages])
  validates :password, length: { minimum: 3 }

  has_secure_password
end
