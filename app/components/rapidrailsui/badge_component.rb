module RapidRailsUI
  class BadgeComponent < RapidRailsUI::BaseComponent
    renders_one :icon, IconComponent
    renders_one :button, ButtonComponent

    attr_reader :text, :status, :icon_name, :url, :close_button, :text_size, :position, :options

    BADGE_WRAPPER = "whitespace-nowrap rounded-full px-2 py-1 relative items-center inline-flex"
    # BADGE_CLASSES = "leading-4"

    # status
    STATUS_DEFAULT = ""
    STATUS_MAPPINGS = {
      STATUS_DEFAULT => "",
      :default => "bg-gray-200 text-gray-800",
      :primary => "bg-purple-200 text-purple-800",
      :info => "bg-sky-200 text-sky-800",
      :success => "bg-emerald-200 text-emerald-800",
      :attention => "bg-yellow-200 text-yellow-800",
      :warning => "bg-orange-200 text-orange-800",
      :critical => "bg-rose-200 text-rose-800",
      :dark => "bg-gray-900 text-gray-200",
      :gh_topic => "dark:bg-[#121f34] text-blue-600 dark:text-blue-500 bg-sky-100 hover:text-white hover:bg-blue-600",
      :gh_label => "dark:bg-[#0d1116] dark:text-gray-400 text-gray-400 border border-1 dark:border-gray-700 border-gray-300 rounded-full",
      :gh_label_archive => "dark:bg-[#0d1116] text-yellow-500 border border-1 border-yellow-700 rounded-full",
      :gh_label_beta => "dark:bg-[#0d1116] text-green-600 border border-1 border-green-600",
      :gh_label_pro => "dark:bg-[#0d1116] text-purple-400 border border-1 border-purple-600",
    }
    STATUS_OPTIONS = STATUS_MAPPINGS.keys

    # indicator
    INDICATOR_DEFAULT = :default
    INDICATOR_MAPPINGS = {
      INDICATOR_DEFAULT => "",
      :online => "bg-green-500",
      :offline => "bg-gray-500",
      :busy => "bg-red-500",
      :away => "bg-yellow-500",
    }
    INDICATOR_OPTIONS = INDICATOR_MAPPINGS.keys

    # icon
    ICON_DEFAULT = :default
    ICON_MAPPINGS = {
      ICON_DEFAULT => "",
      :primary => "text-purple-600",
      :info => "text-blue-600",
      :warning => "text-yellow-600",
      :danger => "text-rose-600",
      :success => "text-teal-600",
    }
    ICON_OPTIONS = ICON_MAPPINGS.keys

    TEXT_SIZE_DEFAULT = ""
    TEXT_SIZE_MAPPINGS = {
      TEXT_SIZE_DEFAULT => "",
      :xs => "text-xs",
      :sm => "text-sm",
      :md => "text-md",
      :lg => "text-lg font-medium",
      :xl => "text-xl px-1 py-1 font-semibold",
      :xl2 => "text-2xl px-1 py-1 font-semibold",
    }
    TEXT_SIZE_OPTIONS = TEXT_SIZE_MAPPINGS.keys

    POSITION_DEFAULT = :default
    POSITION_CLASSES = {
      POSITION_DEFAULT => "",
      leading: "order-first ms-0 me-1.5",
      trailing: "order-last ms-1.5 me-0"
    }

    def initialize(
      text: nil,
      status: STATUS_DEFAULT,
      icon_name: nil,
      url: nil,
      close_button: nil,
      text_size: TEXT_SIZE_DEFAULT,
      position: POSITION_DEFAULT,
      **options
      )
      @text = text
      @status = status
      @icon_name = icon_name
      @close_button = close_button
      @tag = url.present? ? "a" : ""
      @text_size = text_size
      @position = position
      @options = options
      # super(tag: 'span', **options)
      @options[:classes] = class_names(
        @options[:classes],
        POSITION_CLASSES[@position],
        badge_classes
        # "relative inline-flex items-center",
      )

      if url.present?
        @options.update({tag: "a"})
        @options[:href] = url
        @options[:rel] = "noopener noreferrer"
        @options[:classes] = class_names(
          @options[:classes],
          "cursor-pointer border dark:border-blue-900 border-blue-200",
          )
      end

      if close_button.present?
        @options[:classes] = class_names(
          "gap-1.5 whitespace-nowrap rounded-full px-2 py-1 relative items-center inline-flex",
          STATUS_MAPPINGS[@status],
          POSITION_CLASSES[@position],
          )
      end

    end

    def badge_classes
      classes = [
        BADGE_WRAPPER,
        STATUS_MAPPINGS[@status],
        INDICATOR_MAPPINGS[@indicator],
        ICON_MAPPINGS[@icon],
      ].compact.join(' ')
    end

    def text_classes
        TEXT_SIZE_MAPPINGS[@text_size]
    end
  end
end
