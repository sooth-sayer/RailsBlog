Configus.build Rails.env do
  env :production do
    user do
      name "user"
      password "pass"
    end
    mailer do
      default_host "damp-sands-9749.herokuapp.com"
      default_from "noreply@damp-sands-9749.herokuapp.com"
    end
  end

  env :development, :parent => :production do
    mailer do
      default_host "localhost"
      default_from "noreply@localhost"
    end
  end

  env :test, :parent => :production do
  end
end
