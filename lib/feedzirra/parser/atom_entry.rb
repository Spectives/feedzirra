module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Atom feed entries.
    #
    # == Attributes
    # * title
    # * url
    # * author
    # * content
    # * summary
    # * published
    # * categories
    class AtomEntry
      include SAXMachine
      include FeedEntryUtilities
      element :title
      element :"feedburner:origLink", :as => :orig_url # stupid feedburner does weird things with some feeds, we need to be able to manually distinguis them
      element :link, :as => :url, :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :name, :as => :author
      element :content
      element :summary
      element :published
      element :id
      element :created, :as => :published
      element :issued, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link, :as => :links, :value => :href
      elements :link, :as => :enclosure_links, :value => :href, :with => {:rel => "enclosure"}
      
      def url
        @url || links.first
      end
    end

  end
  
end