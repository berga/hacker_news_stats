require "awesome_print"

module HackerNewsStats
  module Gui
    module Cli
      class Application

        def initialize(posts)
          @posts = posts
        end

        def display
          puts "Hacker News Stats - Latest posts and user's statistics\n--------------"
          @posts.each do |post|
            self.show(post)
            puts "------"
          end
          puts "======= END ======"
        end

        def show(post)
          ap({
                 author: post.author,
                 karma: post.karma,
                 submitted: post.submitted,
                 stack_user: post.stack_user,
                 stack_reputation: post.stack_reputation,
                 twitter_user: post.twitter_user,
                 twitter_tweets: post.twitter_tweets
             })
        end

        def self.start
          self.new(Client::HackerNewsFeed.new.latest).display
        end
      end
    end
  end
end