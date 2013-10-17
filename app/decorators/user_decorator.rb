class UserDecorator < Draper::Decorator
  extend BlockquotesDecoratorHelper
  blockquotes_decorated :name, :email, class: "text-warning"

  delegate_all
end
