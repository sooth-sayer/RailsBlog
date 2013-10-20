class UserMailer < ActionMailer::Base
  default_url_options[:host] = configus.mailer.default_host
  default from: configus.mailer.default_from

  def welcome_email(user)
    @user = user
    mail to: @user.email
  end
end
