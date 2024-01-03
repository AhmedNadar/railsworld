# app/components/rapidrailsui/tab_component.rb
module RapidRailsUI
  class TabComponent < Component
    renders_one :icon, IconComponent
    renders_one :badge, BadgeComponent
    renders_one :button, ButtonComponent
    renders_one :avatar, ButtonComponent

    attr_reader :title, :panel_id, :active

    renders_one :panel

    def initialize(title: , panel_id:, active: false, **options)
      super(**options)
      @title = title
      @panel_id = panel_id
      @active = active
      @options = options
      @options[:classes] = class_names(
        @options[:classes],
        "tab",
        "active" => @active,
      )
    end
  end
end
