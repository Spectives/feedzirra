module Feedzirra
  module Parser
    class MRSSText
      include SAXMachine
      
      element :'media:text', :as => :type, :value => :type
      element :'media:text', :as => :lang, :value => :lang
      element :'media:text', :as => :start, :value => :start
      element :'media:text', :as => :end, :value => :end
      element :'media:text', :as => :text
    end
  end
end