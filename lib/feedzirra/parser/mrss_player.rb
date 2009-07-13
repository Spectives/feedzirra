module Feedzirra
  module Parser
    class MRSSPlayer
      include SAXMachine
      
      element :'media:player', :value => :url, :as => :url
      element :'media:player', :value => :width, :as => :width
      element :'media:player', :value => :height, :as => :height
    end
  end
end