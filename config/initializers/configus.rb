Configus.build Rails.env do
  env :production do
    user do
      name "user"
      password "pass"
    end
  end

  env :development, :parent => :production do
  end

  env :test, :parent => :production do
  end
end
