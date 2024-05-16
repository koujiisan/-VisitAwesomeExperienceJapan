class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    extracted_locale = extract_locale_from_accept_language_header
    Rails.logger.debug "Extracted Locale: #{extracted_locale}"
    I18n.locale = extracted_locale || I18n.default_locale
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
end
