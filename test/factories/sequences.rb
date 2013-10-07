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
end
