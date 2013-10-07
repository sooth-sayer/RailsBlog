FactoryGirl.define do
  factory "post/comment" do
    commenter "Commenter"
    body
    association :post, comments_count: 0
  end
end
