class UserDecorator < Draper::Decorator
  delegate_all

  def blockquotes_name
    warning_blockquotes(name)
  end

  def blockquotes_email
    warning_blockquotes(email)
  end

  private
    def warning_blockquotes(content)
      h.content_tag :blockquote, class: "text-warning" do
        content
      end.html_safe
    end
end
