module Feedzirra
  module Parser
    class RSSEntry
      class MRSSHash
        element :'media:hash', :as => :hash
        element :'media:hash', :value => :algo, :as => :algo
      end
    end
  end
end