class ApplicationDecorator < Draper::Decorator
  def self.blockquotes_decorated(*methods)
    options = methods.extract_options!

    delegate *methods, options

    to = options.delete(:to) || :object
    to = to.to_s

    file, line = caller.first.split(':', 2)
    line = line.to_i

    methods.each do |method|
      class_eval(<<-EOS, file, line - 3)
        def blockquotes_#{method}
          helpers.content_tag :blockquote, #{options} do
            #{to}.#{method}
          end.html_safe
        end
      EOS
    end
  end

  def created_at
    helpers.content_tag :span, class: 'time' do
      helpers.l object.created_at, :format => :full
    end.html_safe
  end
end
