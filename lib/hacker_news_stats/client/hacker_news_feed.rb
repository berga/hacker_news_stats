require 'httparty'

module HackerNewsStats
  module Client
    class HackerNewsFeed
      include HTTParty
      base_uri 'https://news.ycombinator.com'

      def latest
        self.class.get('/rss').all
      end

      parser Proc.new { |data| Parser.parse(data) }
    end
  end
end