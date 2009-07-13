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
    class MRSSGroup
      include SAXMachine

      elements :'media:content', :as => :media_content, :class => MRSSContent

      # optional elements
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
    end
  end
end
