require 'yaml'

module HackerNewsStats
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :twitter

    def initialize
      @twitter = YAML.load_file(
          File.expand_path(
              File.join(File.dirname(__FILE__), '..', '..', 'config', 'twitter.yml')
          )
      ) rescue nil
    end
  end
end