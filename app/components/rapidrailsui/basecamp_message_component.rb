module RapidRailsUI
  class BasecampMessageComponent < Component
    attr_reader :title, :message, :type, :icon_name

    def initialize(title: nil, message: nil, type: :type, icon_name:, **options)
      @title = title
      @message = message
      @type = type
      @icon_name = icon_name || type # Fallback to type if icon_name is not provided
      @options = options
    end

    private

    def basecamp_blank_slate
      StyleManager.basecamp_classes
    end
    def basecamp_icon
      StyleManager.basecamp_icon_classes
    end
    def basecamp_content
      StyleManager.basecamp_content_classes
    end
    def basecamp_title
      StyleManager.basecamp_title_classes
    end
    def basecamp_message
      StyleManager.basecamp_message_classes
    end
    def basecamp_type(type)
      StyleManager.basecamp_type_classes(@type)
    end
  end
end
