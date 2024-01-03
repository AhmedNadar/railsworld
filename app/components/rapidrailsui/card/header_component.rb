class RapidRailsUI::Card::HeaderComponent < RapidRailsUI::Component
  renders_one :text, RapidRailsUI::TextComponent
  renders_many :badges, RapidRailsUI::BadgeComponent

  attr_reader :title, :options

  def initialize(
    title: "",
    **options
  )
    @title = title
    @options = options
    @options[:tag] = :header
    @options[:role] = "banner"
    @options[:classes] = class_names(
      @options[:classes],
      "card_header",
      "mb-2 font-semibold text-gray-900 dark:text-white"
    )
  end

end
