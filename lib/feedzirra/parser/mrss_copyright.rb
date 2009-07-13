module Feedzirra
  module Parser
    class MRSSCopyright
      include SAXMachine
      
      element :'media:copyright', :as => :copyright
      element :'media:copyright', :as => :url, :value => :url
    end
  end
end