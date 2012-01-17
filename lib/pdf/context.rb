# encoding: utf-8

class Pdf
  class RailsContext
    include ActionView::Helpers::TagHelper
    #include ActionView::Helpers::SanitizeHelper # <-- stupid broken coupling
    def sanitize(html, options = {})
      white_list_sanitizer.sanitize(html, options).try(:html_safe)
    end
    def white_list_sanitizer
      @white_list_sanitizer ||= HTML::WhiteListSanitizer.new
    end
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::DateHelper

    attr_accessor :output_buffer
    attr_reader :controller

    def initialize(controller)
      @controller     = controller
      @output_buffer  = ""
    end

    delegate :dom_class,
             :dom_id,
             :ticket_path,
             :protect_against_forgery?,
             :form_authenticity_token,
             :request_forgery_protection_token,
             :l,
             :t,
             :to => :controller
  end
end
