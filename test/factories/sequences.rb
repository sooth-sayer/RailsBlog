FactoryGirl.define do
  sequence :title do |n|
    "post##{n}"
  end

  sequence :body do |n|
    "This is comment #{n}"
  end
end
