# HackerNewsStats

This funny gem reads Hacker News feed from URL: https://news.ycombinator.com/rss

gets some stats from each of them:

* title
* author
* author's karma
* author's submissions
* stackoverflow matching user w/ reputation;
* twitter matching account and number of tweets.

and display results via Webapp or CLI

## Installation

Execute:

    $ bundle

## Configuration

Copy the example configuration files for Twitter and StackExchange fill it up:

    $ cp config/twitter.example.yml config/twitter.yml
    $ cp config/stack_exchange.example.yml config/stack_exchange.yml


## Usage

Call executable:

    $ bundle exec bin/hacker_news_stats [web|cli]

Default mode runs a Puma Webserver, visit http://localhost:4567 to see the home page

## Contributing

1. Fork it ( https://github.com/berga/hacker_news_stats/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
