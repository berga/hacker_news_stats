require 'haml'
require 'sass'
require 'coffee_script'
require 'sinatra'
require "sinatra/reloader" if development?

module HackerNewsStats
  module Gui
    module Web
      class Application < Sinatra::Base
        set :static, true
        set :public_dir, File.expand_path(File.join('..', 'public'), __FILE__)
        set :views, File.expand_path(File.join('..', 'views'), __FILE__)
        set :haml, {:format => :html5}
        set :server, :puma

        configure :development do
          register Sinatra::Reloader
        end

        get '/' do
          @posts = Client::HackerNewsFeed.new.latest
          haml :'/index'
        end

        get '/application.js' do
          coffee :'../public/javascripts/application'
        end

        get '/application.css' do
          scss :'../public/stylesheets/sass/application'
        end

        get '/posts/:id.?:format?' do
          @post = Post.new(id: params['id'])
          content_type :json
          {
              author: @post.author,
              karma: @post.karma,
              submitted: @post.submitted,
              stack_user: @post.stack_user,
              stack_reputation: @post.stack_reputation,
              twitter_user: @post.twitter_user,
              twitter_tweets: @post.twitter_tweets
          }.to_json
        end
      end
    end
  end
end