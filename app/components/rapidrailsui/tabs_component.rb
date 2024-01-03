# app/components/rapidrailsui/tabs_component.rb
module RapidRailsUI
  class TabsComponent < Component
    renders_many :tabs, TabComponent

    attr_reader :active_tab

    def initialize(active_tab: nil, **options)
      super(**options)
      @active_tab = active_tab
      @options = options
      @options[:classes] = class_names(
        @options[:classes],
        "tabs-container",
      )
    end
  end
end
