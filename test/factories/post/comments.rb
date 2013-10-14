FactoryGirl.define do
  factory "post/comment" do
    body
    association :post, comments_count: 0
    commenter
  end
end
