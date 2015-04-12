require 'httparty'

module HackerNewsStats
  module Client
    class StackExchangeApi
      include HTTParty
      base_uri 'https://api.stackexchange.com'

      def initialize(site)
        @options = {site: site}
      end

      def guess(name)
        @guessed_profile = self.class.get('/users', query: @options.merge({inname: name}))
      end

      def profile
        @guessed_profile
      end

      def reputation
        profile['reputation'] rescue nil
      end
    end
  end
end