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
      element :title
      element :link, :as => :url

      element :"dc:creator", :as => :author
      element :"content:encoded", :as => :content
      element :description, :as => :summary

      element :pubDate, :as => :published
      element :"dc:date", :as => :published
      element :"dc:Date", :as => :published
      element :"dcterms:created", :as => :published


      element :"dcterms:modified", :as => :updated
      element :issued, :as => :published
      elements :category, :as => :categories

      element :guid, :as => :id

      # TODO: uncomment this when the bug is resolved
      # element :enclosure, :value => :length, :as => :enclosure_length
      element :enclosure, :value => :type, :as => :enclosure_type
      element :enclosure, :value => :url, :as => :enclosure_url

      element :'media:thumbnail', :as => :media_thumbnail, :value => :url
      element :'media:thumbnail', :as => :media_thumbnail_width, :value => :width
      element :'media:thumbnail', :as => :media_thumbnail_height, :value => :height
      element :'media:description', :as => :media_description
      elements :'media:content', :as => :media_content, :class => MRSSContent

    end

  end

end