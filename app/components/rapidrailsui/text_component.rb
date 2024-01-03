# frozen_string_literal: true
# app/components/rapidrailsui/text_component.rb

module RapidRailsUI
  class TextComponent < Component
    # include ActionView::Helpers::TextHelper

    attr_reader :options, :tag, :size, :color, :font, :alignment, :font_weight, :letter_spacing, :line_height, :truncate, :length, :break_word, :highlight, :mark, :underline, :gradient

    renders_one :icon, IconComponent
    renders_one :badge, BadgeComponent

    # Tag
    TAG_DEFAULT = :p
    TAG_OPTIONS = %i[h1 h2 h3 h4 h5 h6 p span blockquote]
    TAG_MAPPINGS = {
      h1: "h1",
      h2: "h2",
      h3: "h3",
      h4: "h4",
      h5: "h5",
      h6: "h6",
      p: "p",
      span: "span",
      blockquote: "blockquote",
    }
    TAG_OPTIONS = TAG_MAPPINGS.keys

    # Font size
    FONT_SIZE_DEFAULT = :bodyMd
    FONT_SIZE_MAPPINGS = {
      FONT_SIZE_DEFAULT => "",
      headingXs: "text-xs",
      headingSm: "text-sm",
      headingMd: "text-md",
      headingLg: "text-lg",
      headingXl: "text-xl",
      heading2Xl: "text-2xl",
      heading3Xl: "text-3xl",
      heading4Xl: "text-4xl",
      heading5Xl: "text-5xl",
      heading6Xl: "text-6xl",
      bodyXs: "text-xs",
      bodySm: "text-sm",
      bodyMd: "text-md",
      bodyLg: "text-lg"
    }
    FONT_SIZE_OPTIONS = FONT_SIZE_MAPPINGS.keys

    # Color
    COLOR_DEFAULT = :default
    COLOR_MAPPINGS = {
      COLOR_DEFAULT => :bnw,
      bnw: "dark:text-white text-black",
      default: "text-gray-600 dark:text-gray-400",
      secondary: "text-gray-600 dark:text-gray-500",
      primary: "text-purple-800 dark:text-purple-400",
      info: "text-blue-800 dark:text-blue-400",
      warning: "text-yellow-800 dark:text-yellow-400",
      danger: "text-rose-800 dark:text-rose-400",
      success: "text-teal-800 dark:text-teal-400",
    }
    COLOR_OPTIONS = COLOR_MAPPINGS.keys

    # Font style
    FONT_WEIGHT_DEFAULT = :normal
    FONT_WEIGHT_MAPPINGS = {
      FONT_WEIGHT_DEFAULT => "",
      black: "font-black",
      bold: "font-bold",
      think: "font-thin",
      light: "font-light",
      normal: "font-normal",
      italic: "italic",
      underline: "underline",
      strike: "line-through",
    }
    FONT_WEIGHT_OPTIONS = FONT_WEIGHT_MAPPINGS.keys

    # Letter spacing
    LETTER_SPACING_DEFAULT = :normal
    LETTER_SPACING_MAPPINGS = {
      LETTER_SPACING_DEFAULT => "",
      tighter: "tracking-tighter",
      tight: "tracking-tight",
      normal: "tracking-normal",
      wide: "tracking-wide",
      wider: "tracking-wider",
      widest: "tracking-widest",
    }
    LETTER_SPACING_OPTIONS = LETTER_SPACING_MAPPINGS.keys

    # Line height
    LINE_HEIGHT_DEFAULT = :normal
    LINE_HEIGHT_MAPPINGS = {
      LINE_HEIGHT_DEFAULT => "",
      none: "leading-none",
      tight: "leading-tight",
      snug: "leading-snug",
      normal: "leading-normal",
      relaxed: "leading-relaxed",
      loose: "leading-loose",
    }
    LINE_HEIGHT_OPTIONS = LINE_HEIGHT_MAPPINGS.keys

    # Text align
    TEXT_ALIGNMENT_DEFAULT = :left
    TEXT_ALIGNMENT_MAPPINGS = {
      TEXT_ALIGNMENT_DEFAULT => "",
      left: "text-left",
      center: "text-center",
      right: "text-right",
      justify: "text-justify",
    }
    TEXT_ALIGNMENT_OPTIONS = TEXT_ALIGNMENT_MAPPINGS.keys

    # Text font
    FONT_DEFAULT = :sans
    FONT_MAPPINGS = {
      FONT_DEFAULT => "",
      sans: "font-sans",
      serif: "font-serif",
      poppins: "font-poppins",
      merriweather: "font-merriweather"
    }
    FONT_OPTIONS = FONT_MAPPINGS.keys

    # Truncate
    TRUNCATE_DEFAULT = false
    TRUNCATE_OPTIONS = [true, false]

    def initialize(
      tag: TAG_DEFAULT,
      font_weight: FONT_WEIGHT_DEFAULT,
      size: FONT_SIZE_DEFAULT,
      color: COLOR_DEFAULT,
      font: FONT_DEFAULT,
      alignment: TEXT_ALIGNMENT_DEFAULT,
      letter_spacing: LETTER_SPACING_DEFAULT,
      line_height: LINE_HEIGHT_DEFAULT,
      truncate: false,
      length: 420,
      break_word: nil,
      highlight: nil,
      mark: nil,
      underline: nil,
      gradient: nil,
      **options
      )
      @tag = fetch_or_fallback(TAG_OPTIONS, tag, TAG_DEFAULT)
      @size = size
      @font = font
      @color = color
      @alignment = alignment
      @font_weight = font_weight
      @letter_spacing = letter_spacing
      @line_height = line_height
      @truncate = truncate
      @length = length
      @break_word = break_word
      @options = options
      @highlight = highlight
      @mark = mark
      @underline = underline
      @gradient = gradient
      super(**options)

      @options[:classes] = class_names(
        @options[:classes],
        text_classes,
        color_classes,
        font_style,
        alignment_classes,
        letter_spacing_classes,
        line_height_classes,
        FONT_SIZE_MAPPINGS[@size],
        FONT_MAPPINGS[@font],
        # "block min-w-0 m-0",
        "blockquote": @tag == :blockquote,
        "max-w-lg" => @truncate || @break_word,
      )

      if truncate.present?
        @options[:classes] = class_names(
          "truncate-to-#{@length}",
          @options[:classes]
        )
      end

      if break_word.present?
        @options[:classes] = class_names(
          "break-words",
          @options[:classes])
      end
    end
    def processed_content
      styles = { highlight: @highlight, mark: @mark, underline: @underline, gradient: @gradient }
      apply_styles(content, styles)
      # @truncate ? ActionController::Base.helpers.truncate(content, length: @length) : content
    end

    def text_classes
      classes = [
        FONT_SIZE_MAPPINGS[@size],
      ].compact.join(' ')
    end
    def color_classes
      retuen nil if @color.nil?

      COLOR_MAPPINGS[fetch_or_fallback(COLOR_OPTIONS, @color, COLOR_DEFAULT)]
    end

    def font_style
      return nil if @font_weight.nil?

      FONT_WEIGHT_MAPPINGS[fetch_or_fallback(FONT_WEIGHT_OPTIONS, @font_weight, FONT_WEIGHT_DEFAULT)]
    end

    def letter_spacing_classes
      LETTER_SPACING_MAPPINGS[fetch_or_fallback(LETTER_SPACING_OPTIONS, @letter_spacing, LETTER_SPACING_DEFAULT)]
    end

    def line_height_classes
      LINE_HEIGHT_MAPPINGS[fetch_or_fallback(LINE_HEIGHT_OPTIONS, @line_height, LINE_HEIGHT_DEFAULT)]
    end

    def alignment_classes
      return nil if @alignment.nil?

      TEXT_ALIGNMENT_MAPPINGS[fetch_or_fallback(TEXT_ALIGNMENT_OPTIONS, @alignment, TEXT_ALIGNMENT_DEFAULT)]
    end

    private

    # def fetch_or_fallback(valid_options, given_option, default_option)
    #   valid_options.include?(given_option) ? given_option : default_option
    # end

    def apply_styles(text, styles)
      styles.each do |style, value|
        text = apply_style(text, value, "#{style}_text") if value
      end
      text
    end

    def apply_style(text, style_value, style_class)
      text.gsub(style_value, "<span class=\"#{style_class}\">#{style_value}</span>")
    end
  end
end

