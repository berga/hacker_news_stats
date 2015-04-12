require 'yaml'
require 'twitter'

module HackerNewsStats
  module Client
    class TwitterApi
      attr_reader :client

      def initialize(config)
        @client = Twitter::REST::Client.new config
      end

      # twitter matching account
      def guess(name)
        @guessed_profile = client.user(name) rescue nil
      end


      def profile
        @guessed_profile
      end

      # number of tweets
      def tweet_count
        profile.statuses_count rescue nil
      end
    end
  end
end