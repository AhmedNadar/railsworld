# frozen_string_literal: true
# app/components/rapidrailsui/headless_button.rb
module RapidRailsUI
  class HeadlessButton < BaseComponent
    attr_reader :size, :style, :options, :url

    renders_one :icon, IconComponent

    # Shape
    SHAPE_DEFAULT = :default
    SHAPE_MAPPINGS = {
      SHAPE_DEFAULT => :default,
      rounded: "rounded-lg",
      pill: "rounded-full",
      square: "rounded-none",
    }
    SHAPE_OPTIONS = SHAPE_MAPPINGS.keys.freeze

    def initialize(
      url: nil,
      style: nil,
      size: SIZE_DEFAULT,
      # text: nil,
      icon_name: nil,
      submit: false,
      text_align: TEXT_ALIGN_DEFAULT,
      full_width: false,
      external: false,
      disabled: false,
      shape: :default,
      **options
      )
      @style = style
      @size = size
      # @text = text
      @icon_name = icon_name
      @text_align = text_align
      @full_width = full_width
      @shape = shape
      @tag = url.present? ? "a" : "button"
      @options = options
      @options[:type] = submit ? "submit" : "button"
      @text_classes = class_names(
        "rui-button__text items-center"
      )
      @options[:classes] = class_names(
        @options[:classes],
        button_classes,
        SHAPE_MAPPINGS[@shape] => @shape.present?,
        "rui-button--full-width" => @full_width
      )
      if url.present?
        @options.delete(:type)
        @options[:href] = url
        @options[:target] = "_blank" if external
        @options[:rel] = "noopener noreferrer" if external
        @options[:role] = "link"
        @options[:hreflang] = "en"
      end
      if disabled
        @options[:disabled] = disabled
      end
    end

    def button_classes
      classes = [
        StyleManager.base_classes,
        StyleManager.style_classes(@style),
        StyleManager.size_classes(@size),
        StyleManager.text_align_classes(@text_align)
      ].compact.join(' ')
    end
  end
end
