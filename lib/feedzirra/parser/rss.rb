require File.dirname(__FILE__) + '/mrss_credit'
require File.dirname(__FILE__) + '/mrss_restriction'
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
    # Parser for dealing with RSS feeds.
    #
    class RSS
      include SAXMachine
      include FeedUtilities

      attr_accessor :feed_url

      # RSS 2.0 required elements
      element :title
      element :link, :as => :url
      element :description
      elements :item, :as => :entries, :class => RSSEntry

      # RSS 2.0 optional elements
      element :language
      element :copyright
      element :managingEditor
      element :webMaster
      element :pubDate
      element :lastBuildDate
      element :category
      element :generator
      element :docs
      element :cloud
      element :ttl
      element :image, :class => RSSImage
      element :rating
      element :textInput
      element :skipHours
      element :skipDays

      # iTunes
      element :'itunes:author', :as => :author
      element :'itunes:block', :as => :itunes_block
      element :'itunes:image', :as => :image, :value => :href
      element :'itunes:explicit', :as => :explicit
      element :'itunes:keywords', :as => :keywords
      element :'itunes:new-feed-url', :as => :feed_url
      element :'itunes:name', :as => :owner_name
      element :'itunes:email', :as => :owner_email
      element :'itunes:subtitle', :as => :subtitle
      element :'itunes:summary', :as => :summary

      elements :'itunes:category', :as => :categories, :value => :text
      # elements :'itunes:category', :as => :itunes_categories,
      #   :class => ITunesCategory

      # MediaRSS support
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

      def self.able_to_parse?(xml) #:nodoc:
        xml =~ /\<rss|\<rdf/
      end
    end
  end
end