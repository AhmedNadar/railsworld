# frozen_string_literal: true

module RapidRailsUI
  class Component < ViewComponent::Base
    include StyleManager # Ensure StyleManager is included in all components
    include ViewHelper # Ensure ViewHelper is included in all components
  end
end
