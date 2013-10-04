FactoryGirl.define do

  factory :comment do
    commenter "Commenter"
    body "Comment body"
    association :post, comments_count: 0
  end

  factory :post do
    title
    text "Some useful text"

    ignore do
      comments_count 1
    end

    after(:create) do |post, evaluator|
      FactoryGirl.create_list(:comment, evaluator.comments_count, post: post)
    end
  end
end
