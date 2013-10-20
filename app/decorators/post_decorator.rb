class PostDecorator < Draper::Decorator
  delegate_all

  def created_at
    h.content_tag :span, class: 'time' do
      h.l object.created_at, :format => :full
    end.html_safe
  end
end
