# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'yaml'

module Enabler
  class Fetcher
    attr_reader :url, :file_name

    def initialize(name)
      @file_name = "#{File.expand_path(__dir__).split('/')[0..-3].join('/')}/tmp/#{name}.yml"
      @url = "https://raw.githubusercontent.com/rubocop-hq/#{name}/master/config/default.yml"
    end

    def fetch
      file = File.new(file_name, 'w+')
      file.puts(download(url))
      file.close
      yml = YAML.load_file(file_name)
      File.delete(file_name)
      yml
    end

    private

    def download(url, limit = 5)
      uri = URI.parse(url)
      request = Net::HTTP::Get.new(uri.path)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(request) }
      case response
      when Net::HTTPSuccess then response.body
      when Net::HTTPRedirection then download(response['location'], limit - 1)
      else response.error! end
    end
  end
end
