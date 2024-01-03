# frozen_string_literal: true


# app/helpers/rapidrailsui/view_helper.rb
module RapidRailsUI
  module ViewHelper
    RAPIDRAILSUI_COMPONENTS = {
      button: "RapidRailsUI::HeadlessButton",
      icon: "RapidRailsUI::IconComponent",
      social: "RapidRailsUI::SocialButtonComponent",
      alert: "RapidRailsUI::AlertComponent",
      basecamp_message: "RapidRailsUI::BasecampMessageComponent",
      avatar: "RapidRailsUI::AvatarComponent",
      badge: "RapidRailsUI::BadgeComponent",
      text: "RapidRailsUI::TextComponent",
      profile: "RapidRailsUI::ProfileComponent",
      image: "RapidRailsUI::ImageComponent",
      tabs: "RapidRailsUI::TabsComponent",
      card: "RapidRailsUI::CardComponent",
      # Add more components as needed
    }.freeze

    RAPIDRAILSUI_COMPONENTS.each do |name, component|
      define_method "rui_#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end

    def fetch_or_fallback(valid_options, given_option, default_option)
      valid_options.include?(given_option) ? given_option : default_option
    end

  end
end

