require 'cgi'

module HackerNewsStats
  class Post
    include SAXMachine
    element :title
    element :link
    element :comments
    element :description

    # Item is instantiable by a given ID
    # to call other profile fields
    def initialize(attributes={})
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    # extract id param from comments path
    def id
      @id ||= begin
        comments_query = URI.parse(self.comments).query
        params = CGI::parse(comments_query)
        params['id'].first
      end
    end

    def author
      self.details['by']
    end

    # author's karma
    def karma
      self.user['karma']
    end

    # author's submissions count
    def submitted
      self.user['submitted'].size rescue 0
    end

    # stackoverflow matching user
    def stack_user
      @stack_user ||= stack_client.guess(self.author)
    end

    # stackoverflow reputation
    def stack_reputation
      @stack_user.reputation if @stack_user
    end

    # twitter matching user
    def twitter_user
      twitter_client.guess(self.author).screen_name rescue nil
    end

    # number of tweets
    def twitter_tweets
      twitter_client.tweet_count rescue nil
    end

    protected
    def details
      @details ||= self.api_client.item(self.id)
    end

    def user
      @user ||= self.api_client.user(self.author)
    end

    def api_client
      @api_client ||= Client::HackerNewsApi.new
    end

    def stack_client
      @stack_client ||= Client::StackExchangeApi.new(:stackoverflow)
    end

    def twitter_client
      @twitter_client ||= Client::TwitterApi.new(HackerNewsStats.configuration.twitter)
    end
  end
end