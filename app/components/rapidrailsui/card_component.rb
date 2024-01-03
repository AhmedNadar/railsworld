# app/components/rapidrailsui/card_component.rb
module RapidRailsUI
  class CardComponent < BaseComponent
    attr_reader :title, :width, :url, :external, :options, :shape, :credits, :credits_action_alignment

    renders_one :header, RapidRailsUI::Card::HeaderComponent
    renders_one :footer, RapidRailsUI::Card::FooterComponent
    renders_many :regions, RapidRailsUI::Card::RegionComponent
    renders_one :text, RapidRailsUI::TextComponent
    renders_many :badges, RapidRailsUI::BadgeComponent
    renders_many :tabs, RapidRailsUI::TabsComponent
    renders_many :buttons, RapidRailsUI::ButtonComponent
    renders_many :images, RapidRailsUI::ImageComponent


    # Shape
    SHAPE_DEFAULT = :default
    SHAPE_MAPPINGS = {
      SHAPE_DEFAULT => :default,
      rounded: "rounded-lg",
      square: "rounded-none",
    }
    SHAPE_OPTIONS = SHAPE_MAPPINGS.keys.freeze

    # width
    WIDTH_DEFAULT = :default
    WIDTH_MAPPINGS = {
      WIDTH_DEFAULT => "",
      default: "",
      xs: "max-w-xs",
      sm: "max-w-sm",
      md: "max-w-md",
      lg: "max-w-lg",
      xl: "max-w-xl",
      xl2: "max-w-2xl",
      xl3: "max-w-3xl",
      xl4: "max-w-4xl",
      xl5: "max-w-5xl",
      xl6: "max-w-6xl",
      xl7: "max-w-7xl",
      full: "max-w-full",
      max: "max-w-max",
    }
    WIDTH_OPTIONS = WIDTH_MAPPINGS.keys.freeze

    def initialize(
      title: "",
      flush: false,
      shape: :default,
      credits: "",
      credits_action_alignment: "",
      width: WIDTH_DEFAULT,
      url: nil,
      external: false,
      **options
      )
      super(tag: 'artical', **options)
      @title = title
      @flush = flush
      @shape = shape
      @credits = credits
      @width = width
      @credits_action_alignment = credits_action_alignment
      @tag = url.present? ? "a" : @tag
      @external = external
      @options = options
      @options[:role] = "main"
      @options[:classes] = class_names(
        @options[:classes],
        card_classes,
        "p-0": flush,
      )

      if url.present?
        @options.delete(:type)
        @options[:href] = url
        @options[:target] = "_blank" if external
        @options[:rel] = "noopener noreferrer" if external
        @options[:role] = "link"
        @options[:hreflang] = "en"
        @options[:tabindex] = "0"
        @options[:classes] = class_names(
          @options[:classes],
          "cursor-pointer dark:hover:bg-gray-700 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-blue-300",
        )
      end
    end

    def card_classes
      class_names(
        "card",
        "flex flex-col",
        "#{WIDTH_MAPPINGS[@width]} block #{"p-6" unless @flush} overflow-hidden bg-white border border-gray-200 #{SHAPE_MAPPINGS[@shape]} dark:bg-gray-800 dark:border-gray-700",
        @options[:classes]
      )
    end
  end
end
