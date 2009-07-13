module Feedzirra
  module Parser
    class MRSSCategory
      include SAXMachine
      
      element :'media:category', :as => :category
      element :'media:category', :value => :scheme, :as => :scheme
      element :'media:category', :value => :label, :as => :label
    end
  end
end