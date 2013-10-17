class PostDecorator < ApplicationDecorator
  delegate_all
  blockquotes_decorated :text, class: "text-success"  
end
