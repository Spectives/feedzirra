module Feedzirra
  module Parser
    class MRSSRating
      include SAXMachine
      
      element :'media:rating', :as => :rating
      element :'media:rating', :value => :scheme, :as => :scheme
    end
  end
end