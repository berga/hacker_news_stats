require 'httparty'

module HackerNewsStats
  module Client
    class HackerNewsApi
      include HTTParty
      base_uri 'https://hacker-news.firebaseio.com/v0'

      def item(id)
        self.class.get("/item/#{id}.json")
      end

      def user(id)
        self.class.get("/user/#{id}.json")
      end
    end
  end
end