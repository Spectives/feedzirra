module Feedzirra
  module Parser
    class RSSEntry
      class MRSSGroup
        include SAXMachine

        elements :'media:content', :as => :media_content, :class => MRSSContent
      end
    end
  end
end
