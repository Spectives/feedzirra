module Feedzirra
  module Parser
    class RSSEntry
      class MRSSThumbnail
        element :'media:thumbnail', :as => :url, :value => :url
        element :'media:thumbnail', :as => :with, :value => :width
        element :'media:thumbnail', :as => :height, :value => :height
      end
    end
  end
end