# frozen_string_literal: true
# # app/components/rapidrailsui/social_button_component.rb
module RapidRailsUI
  class SocialButtonComponent < HeadlessButton
    attr_reader :platform, :style, :size, :options, :classes

    def initialize(text: nil, platform: nil, **options)
      super(**options)
      @platform = platform&.to_sym  # Safely handle nil platform
      @text = text
      combine_platform_classes
    end

    private

    def combine_platform_classes
      platform_classes = StyleManager.social_platform_classes(@platform)
      base_classes = StyleManager.social_base_classes
      style_classes = StyleManager.style_classes(@style)
      size_classes = StyleManager.size_classes(@size)
      @options[:classes] = "#{platform_classes} #{base_classes} #{style_classes} #{size_classes}".strip
    end
  end
end
