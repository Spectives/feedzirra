module Feedzirra
  module Parser
    class RSSEntry
      class MRSSCopyright
        element :'media:copyright', :as => :copyright
        element :'media:copyright', :as => :url, :value => :url
      end
    end
  end
end