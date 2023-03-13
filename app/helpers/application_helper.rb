# frozen_string_literal: true
require 'pagy/extras/bootstrap'

module ApplicationHelper
    include Pagy::Frontend

    def inline_error_for(field, form_obj)
        html = []
        if form_obj.errors[field].any?
            html << form_obj.errors.map do |error|
                tag.div(error, class: 'invalid-feedback d-block text-danger')
            end
        end
        html.join.html_safe
    end
end
