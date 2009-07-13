module Feedzirra
  module Parser
    class RSSEntry
      class MRSSPlayer
        element :'media:player', :value => :url, :as => :url
        element :'media:player', :value => :width, :as => :width
        element :'media:player', :value => :height, :as => :height
      end
    end
  end
end