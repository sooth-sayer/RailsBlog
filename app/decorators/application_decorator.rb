class ApplicationDecorator < Draper::Decorator
  def created_at
    helpers.content_tag :span, class: 'time' do
      helpers.l object.created_at, :format => :full
    end.html_safe
  end
end
