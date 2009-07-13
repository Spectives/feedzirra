module Feedzirra
  module Parser
    class RSSEntry
      class MRSSContent
        include SAXMachine

        element :'media:content', :as => :url, :value => :url
        element :'media:content', :as => :content_type, :value => :type
        element :'media:content', :as => :medium, :value => :medium
        element :'media:content', :as => :duration, :value => :duration
        element :'media:content', :as => :isDefault, :value => :isDefault
        element :'media:content', :as => :expression, :value => :expression
        element :'media:content', :as => :bitrate, :value => :bitrate
        element :'media:content', :as => :framerate, :value => :framerate
        element :'media:content', :as => :samplingrate, :value => :sampling
        element :'media:content', :as => :channels, :value => :duration
        element :'media:content', :as => :height, :value => :height
        element :'media:content', :as => :width, :value => :width
        element :'media:content', :as => :lang, :value => :lang
        element :'media:content', :as => :fileSize, :value => :fileSize
      end
    end
  end
end
