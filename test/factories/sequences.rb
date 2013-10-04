FactoryGirl.define do
  sequence :title do |n|
    "post##{n}"
  end
end
