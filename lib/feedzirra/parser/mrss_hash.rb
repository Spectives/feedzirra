module Feedzirra
  module Parser
    class MRSSHash
      include SAXMachine
      
      element :'media:hash', :as => :hash
      element :'media:hash', :value => :algo, :as => :algo
    end
  end
end