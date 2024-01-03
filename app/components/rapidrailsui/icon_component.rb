# app/components/rapidrailsui/icon_component.rb
module RapidRailsUI
  class IconComponent < Component
    attr_reader :name, :color, :source, :position, :options

    COLOR_DEFAULT = ""
    COLOR_MAPPINGS = {
      COLOR_DEFAULT => "",
      :default => "text-gray-600 dark:text-gray-400",
      :primary => "text-purple-600 dark:text-purple-400",
      :info => "text-indigo-600 dark:text-indigo-400",
      :warning => "text-yellow-600 dark:text-yellow-400",
      :danger => "text-rose-600 dark:text-rose-400",
      :success => "text-teal-600 dark:text-teal-400",
    }
    COLOR_OPTIONS = COLOR_MAPPINGS.keys

    POSITION_DEFAULT = :default
    POSITION_CLASSES = {
      POSITION_DEFAULT => "",
      leading: "order-first ms-0 me-1.5",
      trailing: "order-last ms-1.5 me-0"
    }

    def initialize(
      name: nil,
      color: COLOR_DEFAULT,
      position: POSITION_DEFAULT,
      **options
      )

      @source = name ? uri_icon_source(name) : nil
      @position = position
      @options = options
      @options[:classes] = class_names(
        @options[:classes],
        # "w-4 h-4",
        "rui-icon",
        "rui-button__icon",
        POSITION_CLASSES[@position],
        COLOR_MAPPINGS[color],
      )
    end

    # def icon paths. Any new sunfolders should be added here
    def uri_icon_source(name)
      base_path = Rails.root.join("app", "assets", "images", "rapidrailsui")
      subfolders = ["icons", "brands", "basecamp"]
      subfolders.each do |subfolder|
        path = base_path.join(subfolder, "#{name}.svg")
        return read_svg_file(path) if File.exist?(path)
      end
    end

    def read_svg_file(path)
      file = File.read(path)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css "svg"
      svg[:class] = "rui-icon__svg"
      svg[:focusable] = false
      svg[:"aria-hidden"] = true
      doc.to_html.html_safe
    end
  end
end

