module Feedzirra

  module Parser
    # iTunes extensions to the standard RSS2.0 item
    # Source: http://www.apple.com/itunes/whatson/podcasts/specs.html
    class RSS
      class ITunesCategory
        include SAXMachine
        include FeedEntryUtilities

        element :'itunes:category', :as => :name, :value => :text
        elements :'itunes:category', :as => :sub_categories, :value => :text
      end
    end
  end

end
