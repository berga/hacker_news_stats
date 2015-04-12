require 'sax-machine'
require 'hacker_news_stats/post'

module HackerNewsStats
  class Parser
    include SAXMachine
    elements :item, class: Post, as: :all
  end
end