module Feedzirra
  module Parser
    class MRSSThumbnail
      include SAXMachine
      
      element :'media:thumbnail', :as => :url, :value => :url
      element :'media:thumbnail', :as => :with, :value => :width
      element :'media:thumbnail', :as => :height, :value => :height
    end
  end
end