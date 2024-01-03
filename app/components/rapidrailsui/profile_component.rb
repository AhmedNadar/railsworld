# app/components/rapidrailsui/profile_component.rb
module RapidRailsUI
  class ProfileComponent < BaseComponent
    attr_reader :options, :name, :description, :action_button, :extra_info, :icon, :avatar, :shape, :theme, :layout

    renders_one :avatar, AvatarComponent
    renders_one :name, TextComponent
    renders_one :description, TextComponent
    renders_one :action_button, ButtonComponent
    renders_one :extra_info, TextComponent
    renders_one :icon, IconComponent

    SHAPE_DEFAULT = :square
    SHAPE_MAPPINGS = {
      SHAPE_DEFAULT => "",
      square: "rounded-md",
      rounded: "rounded-full",
    }
    SHAPE_OPTIONS = SHAPE_MAPPINGS.keys.freeze

    # status
    THEME_DEFAULT = :bnw
    THEME_MAPPINGS = {
      THEME_DEFAULT => "",
      bnw: "dark:text-white dark:bg-gray-900 bg-gray-100/50",
      default: "bg-gray-100 dark:bg-gray-800",
      primary: "bg-indigo-100 dark:bg-indigo-800",
      info: "bg-sky-100 dark:bg-sky-800/50",
      success: "bg-emerald-100 dark:bg-emerald-800",
      attention: "bg-yellow-100 dark:bg-yellow-700",
      warning: "bg-orange-100 dark:bg-orange-800",
      critical: "bg-rose-100 dark:bg-rose-800",
    }
    THEME_OPTIONS = THEME_MAPPINGS.keys

    # layout
    LAYOUT_DEFAULT = :horizontal
    LAYOUT_MAPPINGS = {
      LAYOUT_DEFAULT => "",
      horizontal: "flex-row",
      vertical: "flex-col p-6",
    }
    LAYOUT_OPTIONS = LAYOUT_MAPPINGS.keys

    def initialize(
      url: nil,
      shape: SHAPE_DEFAULT,
      external: false,
      theme: THEME_DEFAULT,
      layout: :default,
      **options
      )
      super(tag: 'div', **options)
      @tag = url.present? ? "a" : @tag
      @shape = shape
      @theme = theme
      @layout = layout
      @options = options
      @options[:classes] = class_names(
        @options[:classes],
        horizontal_classes => @layout == :default,
        vertical_layout => @layout == :vertical,
      )

      if url.present?
        @options.delete(:type)
        @options[:href] = url
        @options[:target] = "_blank" if external
        @options[:rel] = "noopener noreferrer" if external
        @options[:classes] = class_names(
          @options[:classes],
          "cursor-pointer ",
        )
      end
    end

    def horizontal_classes
      classes = [
        SHAPE_MAPPINGS[@shape],
        LAYOUT_MAPPINGS[@layout],
        "flex flex-wrap items-center gap-4 py-2 pl-2 pr-6 mx-auto #{THEME_MAPPINGS[@theme]} shadow-lg profile-component w-max",
      ].compact.join(' ')
    end

    def vertical_layout
      classes = [
        SHAPE_MAPPINGS[@shape],
        LAYOUT_MAPPINGS[@layout],
        "flex items-center text-center gap-4 mx-auto #{THEME_MAPPINGS[@theme]} shadow-lg profile-component w-max",
      ].compact.join(' ')
    end


  end
end
