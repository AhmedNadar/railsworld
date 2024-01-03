class RapidRailsUI::Card::RegionComponent < RapidRailsUI::Component
  renders_one :text, RapidRailsUI::TextComponent

  attr_reader :body, :options

  def initialize(
    body: "",
    role: "region",
    labelledby: "label labelledby",
    # aria_label: "label Region",
    **options
    )
    @body = body
    @options = options
    @options[:tag] = :section
    @options[:role] = role
    @options[:"aria-labelledby"] = labelledby
    # @options[:"aria-label"] = aria_label
    @options[:classes] = class_names(
      @options[:classes],
      "card_region",
      "font-normal text-gray-700 dark:text-gray-400"
    )
  end

end
