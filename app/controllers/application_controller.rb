class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  
  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = extract_locale_from_accept_language_header
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
  
  private
  def extract_locale_from_accept_language_header
    lang = request.env['HTTP_ACCEPT_LANGUAGE']
    lang ||= "en-EN"
    lang.scan(/^[a-z]{2}/).first if lang
  end
end
