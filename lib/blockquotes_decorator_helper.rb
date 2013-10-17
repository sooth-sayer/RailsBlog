module BlockquotesDecoratorHelper
  def blockquotes_decorated(*methods)
    options = methods.extract_options!

    delegate *methods, options

    to = options.delete(:to) || :object
    to = to.to_s

    methods.each do |method|
      class_eval <<-EOS
        def blockquotes_#{method}
          helpers.content_tag :blockquote, #{options} do
            #{to}.#{method}
          end.html_safe
        end
      EOS
    end
  end
end
