# app/components/rapidrailsui/alert_component.rb
module RapidRailsUI
  class AlertComponent < BaseComponent
    attr_reader :title, :message, :type, :options

    def initialize(title:, message:, type: :default, **options)
      @title = title
      @message = message
      @type = type
      @options = options
    end

    private

    def alert_base_classes
      StyleManager.alert_base_classes
    end
    def alert_type_classes(type)
      StyleManager.alert_type_classes(@type)
    end

    def alert_text_classes(type)
      StyleManager.alert_text_classes(@type)
    end

    def alert_border_classes(type)
      StyleManager.alert_border_classes(@type)
    end

    def alert_message_classes
      StyleManager.alert_message_classes
    end
  end
end
