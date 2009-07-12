module Feedzirra
  module Parser
    class RSS
      class RSSImage
        include SAXMachine

        element :title
        element :link
        element :url
        element :width
        element :height
      end
    end
  end
end
