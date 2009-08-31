require File.dirname(__FILE__) + '/mrss_content'
require File.dirname(__FILE__) + '/mrss_credit'
require File.dirname(__FILE__) + '/mrss_restriction'
require File.dirname(__FILE__) + '/mrss_group'
require File.dirname(__FILE__) + '/mrss_category'
require File.dirname(__FILE__) + '/mrss_copyright'
require File.dirname(__FILE__) + '/mrss_hash'
require File.dirname(__FILE__) + '/mrss_player'
require File.dirname(__FILE__) + '/mrss_rating'
require File.dirname(__FILE__) + '/mrss_restriction'
require File.dirname(__FILE__) + '/mrss_text'
require File.dirname(__FILE__) + '/mrss_thumbnail'

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
      element :"feedburner:origLink", :as => :url
      element :description, :as => :summary
      element :author
      elements :category, :as => :categories
      element :comments
      element :guid, :as => :id
      element :pubDate, :as => :published
      element :source
      element :enclosure, :value => :length, :as => :enclosure_length
      element :enclosure, :value => :type, :as => :enclosure_type
      element :enclosure, :value => :url, :as => :enclosure_url


      # RDF elements
      element :"dc:date", :as => :published
      element :"dc:Date", :as => :published
      element :"dcterms:created", :as => :published
      element :issued, :as => :published
      element :"content:encoded", :as => :content
      element :"dc:creator", :as => :author
      element :"dcterms:modified", :as => :updated

      # MediaRSS support, optional elements
      element :'media:title', :as => :media_title
      element :'media:keywords', :as => :media_keywords
      element :'media:description', :as => :media_description

      element :'media:thumbnail', :as => :media_thumbnail, :class => MRSSThumbnail
      element :'media:rating', :as => :rating, :class => MRSSRating
      element :'media:category', :as => :media_category, :class => MRSSCategory
      element :'media:hash', :as => :media_hash, :class => MRSSHash
      element :'media:player', :as => :media_player, :class => MRSSPlayer
      elements :'media:credit', :as => :credits, :class => MRSSCredit
      element :'media:copyright', :as => :copyright, :class => MRSSCopyright
      element :'media:restriction', :as => :media_restriction, :class => MRSSRestriction
      element :'media:text', :as => :text, :class => MRSSText
      elements :'media:content', :as => :media_content, :class => MRSSContent
      elements :'media:group', :as => :media_groups, :class => MRSSGroup

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
