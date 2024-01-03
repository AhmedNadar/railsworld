class RapidRailsUI::Card::FooterComponent < RapidRailsUI::Component
  renders_many :texts, RapidRailsUI::TextComponent
  renders_many :buttons, RapidRailsUI::ButtonComponent

  attr_reader :credits, :url, :credits_action_alignment, :external, :options

  # alignment
  ALIGNMENT_DEFAULT = :left
  ALIGNMENT_MAPPINGS = {
    left: "justify-start",
    right: "justify-end",
    center: "mx-auto justify-center",
    between: "flex items-center justify-between",
  }
  ALIGNMENT_OPTIONS = ALIGNMENT_MAPPINGS.keys.freeze

  # style
  STYLE_DEFAULT = :default
  STYLE_MAPPINGS = {
    STYLE_DEFAULT => :default,
    primary: "text-indigo-600 hover:text-indigo-500 dark:hover:text-indigo-400",
    secondary: "text-gray-600 hover:text-gray-500 dark:hover:text-gray-400",
    success: "text-green-600 hover:text-green-500 dark:hover:text-green-400",
    danger: "text-red-600 hover:text-red-500 dark:hover:text-red-400",
    warning: "text-yellow-600 hover:text-yellow-500 dark:hover:text-yellow-400",
    info: "text-blue-600 hover:text-blue-500 dark:hover:text-blue-400",
    light: "text-gray-100 hover:text-gray-200 dark:hover:text-gray-300",
    dark: "text-gray-900 hover:text-gray-800 dark:hover:text-gray-700",
  }
  STYLE_OPTIONS = STYLE_MAPPINGS.keys.freeze

  # text-gray-900 dark:text-white

  attr_reader :credits, :options, :credits_action_alignment, :url, :external, :style

  def initialize(
    credits: "",
    url: nil,
    external: false,
    style: STYLE_DEFAULT,
    credits_action_alignment: ALIGNMENT_DEFAULT,
    **options
    )
    @credits = credits
    @url = url
    @external = external
    @style = style
    @credits_action_alignment = credits_action_alignment
    @options = options
    @options[:tag] = :footer
    @options[:role] = "banner"
    @options[:classes] = class_names(
      @options[:classes],
      "card_credits",
      "flex mt-4 #{STYLE_MAPPINGS[@style]}",
      ALIGNMENT_MAPPINGS[@credits_action_alignment] => @credits_action_alignment.present?
    )
  end
end
