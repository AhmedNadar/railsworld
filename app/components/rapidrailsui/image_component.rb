# app/components/rapidrailsui/profile_component.rb
module RapidRailsUI
  class ImageComponent < BaseComponent
    attr_reader :source, :url, :caption, :options

    # Shape
    SHAPE_DEFAULT = :default
    SHAPE_MAPPINGS = {
      SHAPE_DEFAULT => "",
      default: "",
      rounded: "rounded-lg",
      circle: "rounded-full",
      square: "rounded-none",
    }
    SHAPE_OPTIONS = SHAPE_MAPPINGS.keys.freeze

    # height Size
    SIZE_DEFAULT = :default
    SIZE_MAPPINGS = {
      SIZE_DEFAULT => "",
      default: :auto,
      h10: "h-10",
      h12: "h-12",
      h14: "h-14",
      h16: "h-16",
      h20: "h-20",
      h24: "h-24",
      h28: "h-28",
      h32: "h-32",
      h36: "h-36",
      h40: "h-40",
      h44: "h-44",
      h48: "h-48",
      h52: "h-52",
      h56: "h-56",
      h60: "h-60",
      h64: "h-64",
      h72: "h-72",
      h80: "h-80",
      h96: "h-96",
      full: "h-full",
      auto: "h-auto",
    }
    SIZE_OPTIONS = SIZE_MAPPINGS.keys.freeze

    # width Size
    WIDTH_DEFAULT = :default
    WIDTH_MAPPINGS = {
      WIDTH_DEFAULT => "",
      default: :auto,
      xs: "max-w-xs",
      sm: "max-w-sm",
      md: "max-w-md",
      lg: "max-w-lg",
      xl: "max-w-xl",
      xl2: "max-w-2xl",
      xl3: "max-w-3xl",
      xl4: "max-w-4xl",
      xl5: "max-w-5xl",
      xl6: "max-w-6xl",
      xl7: "max-w-7xl",
      full: "w-full",
      max: "max-w-max"
    }
    WIDTH_OPTIONS = WIDTH_MAPPINGS.keys.freeze


    # alignment
    ALIGNMENT_DEFAULT = :default
    ALIGNMENT_MAPPINGS = {
      ALIGNMENT_DEFAULT => "",
      default: "",
      left: "me-auto",
      right: "ms-auto",
      center: "mx-auto",
    }
    ALIGNMENT_OPTIONS = ALIGNMENT_MAPPINGS.keys.freeze

    def initialize(
      source: nil,
      alt: nil,
      url: nil,
      alignment: :default,
      shape: :default,
      h_size: "",
      width: "",
      caption: nil,
      grayscale: false,
      blur: false,
      group: false,
      classes: nil,
      **options
      )
      @source = source
      @alt = alt
      @url = url
      @shape = shape
      @alignment = alignment
      @h_size = h_size
      @width = width
      @caption = caption
      @grayscale = grayscale
      @blur = blur
      @group = group
      @classes = classes
      @options = options
      # @options[:classes] = class_names(
      #   @options[:classes],
      #   "border-2 border-white",
      # )
    end

    def image_classes
      classes = ["object-cover object-center"]
      classes << SHAPE_MAPPINGS[@shape] if @shape
      classes << ALIGNMENT_MAPPINGS[@alignment] if @alignment
      classes << (SIZE_MAPPINGS[@h_size] || "h-auto") if @h_size
      classes << (WIDTH_MAPPINGS[@width] || "w-full") if @width
      classes << grayscale_classes if @grayscale
      classes << blur_classes if @blur
      classes << @classes if @classes
      classes.join(' ').squeeze(' ').strip
    end

    # def image_classes
    #   classes = [
    #     "object-cover object-center",
    #     SHAPE_MAPPINGS[@shape],
    #     ALIGNMENT_MAPPINGS[@alignment],
    #     "h-auto" ? SIZE_MAPPINGS[@h_size] : !@h_size.present?,
    #     "w-full" ? WIDTH_MAPPINGS[@width] : !@width.present?
    #   ]
    #   # classes << SIZE_MAPPINGS[@h_size] if !group_it
    #   # classes << "h-auto" if !@h_size.present?
    #   classes << grayscale_classes if @grayscale
    #   classes << blur_classes if @blur
    #   classes << @classes if @classes
    #   classes.compact.join(' ').strip
    # end

    def grayscale_classes
      classes = [
        "transition-all duration-300 filter grayscale hover:grayscale-0",
      ].compact.join(' ').strip
    end

    def blur_classes
      classes = [
        "transition-all duration-300 filter blur hover:blur-0",
      ].compact.join(' ').strip
    end

    def group_it
      @options[:classes] = class_names(
        @options[:classes],
        "transition duration-500 group-hover:scale-105",
      )
    end

  end
end


