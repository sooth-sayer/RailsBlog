class UserMailer < ActionMailer::Base
  default_url_options[:host] = configus.mailer.default_host
  default from: configus.mailer.default_from

  def welcome_email(user)
    @user = user
    @url  = user_url @user, host: default_url_options[:host]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
