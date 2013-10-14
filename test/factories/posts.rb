FactoryGirl.define do
  factory :post do
    title
    text
    user

    ignore do
      comments_count 1
    end

    after(:create) do |post, evaluator|
      FactoryGirl.create_list("post/comment", evaluator.comments_count, post: post)
    end
  end
end
