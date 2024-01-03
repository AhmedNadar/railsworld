# frozen_string_literal: true
# app/components/rapidrailsui/base_component.rb
module RapidRailsUI
  class BaseComponent < RapidRailsUI::Component
    def initialize(tag:, classes: nil, **options)
      @tag = tag
      @options = options
      @content_tag_args = prepare_arguments(@options.merge(classes: classes))
    end

    def call
      content_tag(@tag, content, @content_tag_args)
    end

    private

    def prepare_arguments(arguments)
      arguments[:class] = arguments[:classes]
      arguments.delete(:classes)
      arguments
    end
  end
end
