module RapidRailsUI
  class AvatarComponent < RapidRailsUI::BaseComponent
    attr_reader :options, :classes, :alt

    BASE_AVATAR_CLASSES = ""
    # BASE_AVATAR_CLASSES = "object-cover relative inline-block"
    SIZE_DEFAULT = ""
    AVATAR_SIZE_MAPPINGS = {
      # Define sizes specific to avatars
      xs: "h-6 w-6",
      sm: "h-8 w-8",
      md: "h-10 w-10",
      lg: "h-12 w-12",
      xl: "h-16 w-16",
      xl2: "h-20 w-20",
      xl3: "h-24 w-24",
      xl4: "h-28 w-28",
      xl5: "h-32 w-32",
      xl6: "h-36 w-36",
      xl7: "h-40 w-40",
    }
    SIZE_OPTIONS = AVATAR_SIZE_MAPPINGS.keys

    SHAPE_DEFAULT = :round
    SHAPE_MAPPINGS = {
      round: "rounded-full",
      square: "rounded-md"
    }
    SHAPE_OPTIONS = SHAPE_MAPPINGS.keys

    RING_DEFAULT = :none
    RING_MAPPINGS = {
      none: "",
      default: "ring-2 ring-white",
      ring_primary: "ring-2 ring-purple-600",
      ring_info: "ring-2 ring-indigo-600",
      ring_warning: "ring-2 ring-yellow-600",
      ring_danger: "ring-2 ring-rose-600",
      ring_success: "ring-2 ring-teal-600",
    }
    RING_OPTIONS = RING_MAPPINGS.keys

    # Z index
    INDEX_DEFAULT = :default
    INDEX_CLASSES = {
      default: "",
      z10: "z-10",
      z20: "z-20",
      z30: "z-30",
      z40: "z-40",
      z50: "z-50",
      z60: "z-[60]",
      z70: "z-[70]",
    }
    INDEX_OPTIONS = INDEX_CLASSES.keys
    # absolute right-0 block w-3 h-3 border border-white rounded-full bottom-1

    # Indicator
    BASE_INDICATOR_CLASSES = "h-3 w-3 rounded-full border block absolute bottom-0 right-0 shadow-white"
    INDICATOR = :default
    INDICATOR_CLASSES = {
      default: "",
      online: "bg-green-500",
      offline: "bg-gray-500",
      busy: "bg-red-500",
      away: "bg-yellow-500",
    }
    BASE_INDICATOR = BASE_INDICATOR_CLASSES
    INDICATOR_OPTIONS = INDICATOR_CLASSES.keys


    def initialize(
      url: nil,
      initials: nil,
      alt: "Avatar",
      source: nil,
      indicator: false,
      zindex: :default,
      ring: RING_DEFAULT,
      size: SIZE_DEFAULT,
      shape: SHAPE_DEFAULT,
      **options
      )

      @initials = initials
      @tag = url.present? ? "a" : ""
      @size = size
      @alt = alt
      @source = source
      @shape = shape
      @ring = ring
      @zindex = zindex
      @indicator = indicator
      @options = options

      # super(tag: 'span', **options)
      @options[:classes] = class_names(
        @options[:classes],
        # avatar_classes,
        "relative inline-block",
      )

      if url.present?
        @options.update({tag: "a"})
        @options[:href] = url
        @options[:target] = "_blank"
        @options[:rel] = "noopener noreferrer"
        @options[:alt] = alt
        @options[:title] = alt
        @options[:classes] = class_names(
          "transition duration-500 ease-in-out transform hover:drop-shadow-2xl hover:bg-transparent hover:z-[100] hover:scale-125 relative inline-block #{INDEX_CLASSES[@zindex]}",
          @options[:classes])
      end
    end


    # def self.avatar_base_classes
    #   BASE_AVATAR_CLASSES || ""
    # end
    # def self.avatar_size_classes(size_key)
    #   AVATAR_SIZE_MAPPINGS[size_key.to_sym] || AVATAR_SIZE_MAPPINGS[:md]
    # end


    def avatar_classes
      classes = [
        # BASE_AVATAR_CLASSES,
        SHAPE_MAPPINGS[@shape],
        AVATAR_SIZE_MAPPINGS[@size],
        RING_MAPPINGS[@ring],
        # INDEX_CLASSES[@zindex],
        # StyleManager.style_classes(@style),
        # StyleManager.size_classes(@size),
        # base_classes = StyleManager.avatar_base_classes,
        # size_class = StyleManager.avatar_size_classes(@size),
        # "rui-avatar",
      ].compact.join(' ')
    end

  end
end
