class UserDecorator < ApplicationDecorator
  delegate_all
  blockquotes_decorated :name, :email, class: "text-warning"
end
