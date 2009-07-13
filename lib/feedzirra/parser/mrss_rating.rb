module Feedzirra
  module Parser
    class RSSEntry
      class MRSSRating
        element :'media:rating', :as => :rating
        element :'media:rating', :value => :scheme, :as => :scheme
      end
    end
  end
end