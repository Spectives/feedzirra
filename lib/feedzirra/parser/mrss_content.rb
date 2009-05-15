module Feedzirra
  module Parser
    class RSSEntry
      # == Summary
      # Parser for dealing with multiple media:content entries.
      #
      # == Attributes
      # * url
      # * content_type
      # * medium
      # * duration
      class MRSSContent
        include SAXMachine
        include FeedEntryUtilities

        element :'media:content', :as => :url, :value => :url
        element :'media:content', :as => :content_type, :value => :type
        element :'media:content', :as => :medium, :value => :medium
        element :'media:content', :as => :duration, :value => :duration
      end
    end
  end
end