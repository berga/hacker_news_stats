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
    CONFIG_FILES = [:twitter, :stack_exchange]
    attr_accessor *CONFIG_FILES

    def initialize
      CONFIG_FILES.each do |file|
        file_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config', "#{file}.yml"))
        next unless File.exist?(file_path)
        conf = YAML.load_file(file_path) rescue nil
        instance_variable_set(:"@#{file}", conf)
      end
    end
  end
end