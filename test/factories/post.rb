FactoryGirl.define do

  factory :comment do
    commenter "Commenter"
    body "Comment body"
    post
  end

  factory :post do
    title
    text "Some text"

    factory :post_with_comments do
      ignore do
        comments_count 20
      end

      after(:create) do |post, evaluator|
        FactoryGirl.create_list(:comment, evaluator.comments_count, post: post)
      end
    end
  end
end
