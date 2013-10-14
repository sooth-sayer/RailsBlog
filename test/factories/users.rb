# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:commenter] do
    name
    email
    password "pass"
    password_confirmation "pass"
  end
end
