FactoryGirl.define do
  sequence :title do |n|
    "post##{n}"
  end

  sequence :text do |n|
    "Some post text #{n}"
  end

  sequence :body do |n|
    "This is comment #{n}"
  end

  sequence :name do |n|
    "Just Name##{n}"
  end

  sequence :email do |n|
    "email#{n}@fake.com"
  end
end
