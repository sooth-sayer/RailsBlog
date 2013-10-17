class UserMailer < ActionMailer::Base
  default_url_options[:host] = configus.mailer.default_host
  default from: configus.mailer.default_from
end
