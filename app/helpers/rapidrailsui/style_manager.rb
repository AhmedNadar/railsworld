# app/components/rapidrailsui/style_manager.rb
module RapidRailsUI
  module StyleManager    #
    #
    # size classes
    SIZE_DEFAULT = :medium
    SIZE_CLASSES = {
      SIZE_DEFAULT => "text-base px-3.5 py-2.5",
      xs: "text-xs px-2.5 py-1",
      sm: "text-sm px-2.5 py-1",
      base: "text-base px-4 py-2",
      lg: "text-lg px-5 py-2.5",
      xl: "text-xl px-6 py-3",
      xxl: "text-2xl px-6 py-3.5"
    }

    def self.size_classes(size_key)
      return "" if size_key.nil?
      SIZE_CLASSES[size_key.to_sym] || SIZE_CLASSES[SIZE_DEFAULT]
    end
    #
    #
    # text align classes
    TEXT_ALIGN_DEFAULT = :default
    TEXT_ALIGN_CLASSES = {
      TEXT_ALIGN_DEFAULT => "",
      left: "text-left",
      center: "text-center", # Default
      right: "text-right"
    }
    def self.text_align_classes(text_align_key)
      TEXT_ALIGN_CLASSES[text_align_key.to_sym] || TEXT_ALIGN_CLASSES[TEXT_ALIGN_DEFAULT]
    end
    #
    #
    # base classes for all buttons
    BASE_CLASSES ="inline-flex items-center relative m-0 justify-center border tracking-wider font-medium focus:outline-none focus:ring-2 transition-colors duration-200"
    STYLES = {
      default:
      "text-white border-gray-900 bg-black hover:bg-white hover:text-black dark:hover:bg-black dark:text-black dark:bg-white dark:hover:text-white",
      info: "text-white border-sky-600 bg-sky-600 hover:bg-white hover:text-sky-600 dark:hover:bg-sky-600 dark:text-sky-600 dark:bg-white dark:hover:text-white",
      primary:
      "text-white border-indigo-600 bg-indigo-600 hover:bg-white hover:text-indigo-600 dark:hover:bg-indigo-600 dark:text-indigo-600 dark:bg-white dark:hover:text-white",
      dark:
      "text-white border-gray-800 dark:border-gray-700 bg-gray-800 hover:bg-gray-900 hover:text-gray-100 focus:ring-gray-300 dark:bg-gray-800 dark:hover:bg-gray-700",
      light:
      "text-gray-900 bg-white border-gray-300 hover:bg-gray-100 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600",
      alternative:
      "text-neutral-500 text-neutral-900 bg-neutral-100 hover:text-neutral-600 hover:bg-neutral-200 focus:ring-neutral-200 dark:bg-neutral-600 dark:hover:bg-neutral-700 dark:text-neutral-400 dark:border-neutral-600 dark:hover:text-white dark:focus:ring-neutral-700",
      disabled:
      "text-gray-500 bg-gray-400 border-gray-400 dark:text-gray-600 disabled:cursor-not-allowed cursor-not-allowed focus:ring-0 disabled:text-gray-400 disabled:bg-gray-200",
      destructive:
      "text-white bg-rose-700 border-rose-600 hover:bg-rose-800 focus:ring-rose-300 dark:bg-rose-600 dark:hover:bg-rose-700 dark:focus:ring-rose-800 focus:ring-2 focus:outline-none ",
      teal:
      "text-white bg-teal-700 border-teal-600 hover:bg-teal-800 focus:ring-teal-300 dark:bg-teal-600 dark:hover:bg-teal-700 dark:focus:ring-teal-800",
      red:
      "text-white bg-red-700 border-red-600 hover:bg-red-800 focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900",
      rose:
      "text-white bg-rose-700 border-rose-600 hover:bg-rose-800 focus:ring-rose-300 dark:bg-rose-600 dark:hover:bg-rose-700 dark:focus:ring-rose-900",
      yellow:
      "text-white bg-yellow-400 border-yellow-500 hover:bg-yellow-600 focus:ring-yellow-300 dark:bg-yellow-500 dark:hover:bg-yellow-700 dark:focus:ring-yellow-900",
      purple:
      "text-white bg-purple-700 border-purple-600 hover:bg-purple-800 focus:ring-purple-300 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900"
    }
    def self.base_classes
      BASE_CLASSES
    end

    def self.style_classes(style_key)
      # Use :default style if nil or not provided
      # style_key ||= :default
      return "" if style_key.nil?
      style_class = STYLES[style_key.to_sym] || ""
      (style_class.split - BASE_CLASSES.split).join(' ')
    end
    #
    #
    # social button classes
    SOCIAL_BASE_CLASSES = "text-center items-center inline-flex relative border m-0 justify-center rounded-md  px-3.5 py-2.5 font-medium focus:outline-none focus:ring-0 transition-colors duration-200 text-white text-center mr-2"

    SOCIAL_PLATFORM_CLASSES = {
      facebook: "bg-[#3b5998] hover:bg-[#3b5998]/90 focus:ring-[#3b5998]/70 dark:focus:ring-[#3b5998]/55",
      x:        "bg-[#1da1f2] hover:bg-[#1da1f2]/90 focus:ring-[#1da1f2]/70 dark:focus:ring-[#1da1f2]/55",
      github:   "bg-[#24292F] hover:bg-[#24292F]/90 focus:ring-[#24292F]/50 dark:focus:ring-gray-500 dark:hover:bg-[#050708]/30",
      google:   "bg-[#4285F4] hover:bg-[#4285F4]/90 focus:ring-[#4285F4]/70 dark:focus:ring-[#4285F4]/55",
      apple:    "bg-[#050708] hover:bg-[#050708]/90 focus:ring-[#050708]/50 dark:focus:ring-[#050708]/50 dark:hover:bg-[#050708]/30",
      basecemp: "bg-[#fbde08] hover:bg-[#fbde08]/90 focus:ring-[#fbde08]/50 dark:focus:ring-[#fbde08]/50 dark:hover:bg-[#fbde08]/30",
      # Add more platforms as needed
    }
    def self.social_base_classes
      SOCIAL_BASE_CLASSES
    end
    def self.social_platform_classes(platform)
      return "" if platform.nil?
      SOCIAL_PLATFORM_CLASSES[platform.to_sym] || ""
    end
    #
    #
    # alert type classes
    ALERT_BASE_CLASSES = "flex w-full max-w-lg overflow-hidden rounded-lg m-2 justify-start dark:bg-gray-800 shadow-md"
    ALERT_MESSAGE_CLASSES = "mt-2 text-sm text-gray-600 dark:text-gray-200"

    ALERT_TYPE_CLASSES = {
      default:  "flex items-center justify-center w-14 text-gray-500 dark:text-gray-400",
      info:     "flex items-center justify-center w-14 text-sky-100 bg-sky-500",
      success:  "flex items-center justify-center w-14 text-teal-500",
      warning:  "flex items-center justify-center w-14 text-yellow-100 bg-yellow-500",
      danger:   "flex items-center justify-center w-14 text-red-100 bg-red-500",
    }

    ALERT_TEXT_CLASSES = {
      default:  "font-semibold text-gray-500",
      info:     "font-semibold text-sky-600",
      success:  "font-semibold text-teal-600",
      warning:  "font-semibold text-yellow-600",
      danger:   "font-semibold text-red-600",
    }

    ALERT_BORDER_CLASSES = {
      default:  "border border-gray-200 dark:border-gray-400 bg-gray-50",
      info:     "border border-sky-200 dark:border-sky-400 bg-sky-50",
      success:  "border border-teal-200 dark:border-teal-400 bg-teal-50",
      warning:  "border border-yellow-200 dark:border-yellow-400 bg-yellow-50",
      danger:   "border border-red-200 dark:border-red-400 bg-red-50",
    }

    def self.alert_border_classes(type_key)
      ALERT_BORDER_CLASSES[type_key.to_sym] || ""
    end

    def self.alert_base_classes
      ALERT_BASE_CLASSES || ""
    end

    def self.alert_type_classes(type_key)
      ALERT_TYPE_CLASSES[type_key.to_sym] || ""
    end

    def self.alert_text_classes(type_key)
      ALERT_TEXT_CLASSES[type_key.to_sym] || ""
    end

    def self.alert_message_classes
      ALERT_MESSAGE_CLASSES || ""
    end


    # basecamp message
    BASECAMP_CLASSES = "flex w-full max-w-lg overflow-hidden rounded-lg m-2 px-4 justify-start text-basecamp-light_text border-basecamp-light_border bg-basecamp-light_bg dark:text-basecamp-dark_text dark:border-basecamp-dark_border dark:bg-basecamp-dark_bg p-3 border-dashed border-2"

    BASECAMP_ICON = "w-8 h-8 text-basecamp-light_text/30 dark:text-basecamp-dark_text/50"

    BASECAMP_CONTENT = "flex-1 flex-col justify-center ml-4"

    BASECAMP_TYPE_CLASSES = {
      info:     "flex items-center justify-center w-14 text-sky-500 dark:text-sky-500",
      success:  "flex items-center justify-center w-14 text-teal-500 dark:text-teal-500",
      warning:  "flex items-center justify-center w-14 text-yellow-500 dark:text-yellow-500",
      danger:   "flex items-center justify-center w-14 text-red-500 dark:text-red-500",
    }

    BASECAMP_TITLE_CLASSES = "font-semibold text-basecamp-light_text dark:text-basecamp-dark_text mb-2"

    BASECAMP_MESSAGE_CLASSES = "m-0 text-basecamp-light_text/9"

    def self.basecamp_classes
      BASECAMP_CLASSES || ""
    end

    def self.basecamp_icon_classes
      BASECAMP_ICON || ""
    end

    def self.basecamp_content_classes
      BASECAMP_CONTENT || ""
    end

    def self.basecamp_title_classes
      BASECAMP_TITLE_CLASSES || ""
    end

    def self.basecamp_message_classes
      BASECAMP_MESSAGE_CLASSES || ""
    end

    def self.basecamp_type_classes(type_key)
      BASECAMP_TYPE_CLASSES[type_key.to_sym] || ""
    end
  end
end

