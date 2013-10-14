# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name
    email
    password "pass"
    password_confirmation "pass"

    ignore do
      posts_count 1
    end

    after(:create) do |user, evaluator|
      FactoryGirl.create_list("post", evaluator.posts_count, user: user)
    end
  end
end
