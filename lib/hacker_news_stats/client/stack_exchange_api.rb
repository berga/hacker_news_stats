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
        profiles = self.class.get('/users', query: @options.merge({inname: name}))['items'].select do |su|
          su['display_name'] == name
        end
        @guessed_profile = profiles.first
      rescue
        nil
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