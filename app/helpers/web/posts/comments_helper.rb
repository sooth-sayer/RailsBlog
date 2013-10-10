module Web::Posts::CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(partial: "web/posts/comments/comment", object: comment) +
        content_tag(:div, nested_comments(sub_comments), :class => "nested-comments")
    end.join.html_safe
  end
end
