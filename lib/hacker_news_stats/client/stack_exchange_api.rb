require 'httparty'

module HackerNewsStats
  module Client
    class StackExchangeApi
      include HTTParty
      base_uri 'https://api.stackexchange.com'

      def initialize(options={})
        @options = options
      end

      def guess(name)
        profiles = self.class.get('/users', query: @options.merge({inname: name}))
        @guessed_profile = profiles['items'].select do |su|
          su['display_name'] == name
        end.first
      rescue => e
        puts "Exception guessing Stackexchange user #{name} error: #{profiles.body}"
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