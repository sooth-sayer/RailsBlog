class PostDecorator < Draper::Decorator
  extend BlockquotesDecoratorHelper
  blockquotes_decorated :text, class: "text-success"

  delegate_all

  def created_at
    helpers.content_tag :span, class: 'time' do
      helpers.l object.created_at, :format => :full
    end.html_safe
  end
end
