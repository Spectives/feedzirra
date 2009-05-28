require File.dirname(__FILE__) + '/mrss_content'

module Feedzirra
  module Parser
    # == Summary
    # Parser for dealing with RDF feed entries.
    #
    # == Attributes
    # * title
    # * url
    # * author
    # * content
    # * summary
    # * published
    # * categories
    class RSSEntry
      include SAXMachine
      include FeedEntryUtilities

      # RSS 2.0 elements
      element :title
      element :link, :as => :url
      element :description, :as => :summary
      element :author
      elements :category, :as => :categories
      element :comments
      element :guid, :as => :id
      element :pubDate, :as => :published
      element :source

      # RDF elements
      element :"dc:date", :as => :published
      element :"dc:Date", :as => :published
      element :"dcterms:created", :as => :published
      element :issued, :as => :published
      element :"content:encoded", :as => :content
      element :"dc:creator", :as => :author
      element :"dcterms:modified", :as => :updated

      # MediaRSS support
      element :enclosure, :value => :length, :as => :enclosure_length
      element :enclosure, :value => :type, :as => :enclosure_type
      element :enclosure, :value => :url, :as => :enclosure_url

      element :'media:thumbnail', :as => :media_thumbnail, :value => :url
      element :'media:thumbnail', :as => :media_thumbnail_width, :value => :width
      element :'media:thumbnail', :as => :media_thumbnail_height, :value => :height
      element :'media:description', :as => :media_description
      elements :'media:content', :as => :media_content, :class => MRSSContent

      # iTunes
      element :'itunes:author', :as => :author
      element :'itunes:block', :as => :itunes_block
      element :'itunes:duration', :as => :duration
      element :'itunes:explicit', :as => :explicit
      element :'itunes:keywords', :as => :keywords
      element :'itunes:subtitle', :as => :subtitle
      element :'itunes:summary', :as => :summary
    end
  end
end