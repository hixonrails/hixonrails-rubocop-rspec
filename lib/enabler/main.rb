# frozen_string_literal: true

require_relative './fetcher'
require 'yaml'

module Enabler
  class Main
    GEMS = %w[rubocop rubocop-rails rubocop-rspec rubocop-performance rubocop-rake].freeze
    GEM_ROOT_PATH = File.expand_path(__dir__).split('/')[0..-3].join('/')
    CURRENT_CONFIG_PATH = "#{GEM_ROOT_PATH}/default.yml"
    SPECIAL_CONFIG_KEYWORDS = %w[require inherit_mode].freeze
    UNRECOGNIZED_COPS = %w[
      Performance/CollectionLiteralInLoop
      Performance/Sum
      RSpec/RepeatedIncludeExample
      RSpec/StubbedMock
      Rails/AfterCommitOverride
      Rails/OrderById
      Rails/SquishedSQLHeredocs
      Rails/WhereNot
    ].freeze
    EXPLANATORY_KEYS = %w[VersionAdded VersionChanged StyleGuide SupportedStyles].freeze

    private_constant :GEMS
    private_constant :GEM_ROOT_PATH
    private_constant :CURRENT_CONFIG_PATH
    private_constant :SPECIAL_CONFIG_KEYWORDS
    private_constant :UNRECOGNIZED_COPS
    private_constant :EXPLANATORY_KEYS

    def self.run(*args)
      new(*args).call
    end

    def call
      update_current_config!
      overwrite_config!
    end

    private

    def update_current_config!
      latest_config.each do |cop, settings|
        current_config[cop] = settings.merge(current_config[cop] || {}).tap(&prepare(cop))
      end
    end

    def prepare(cop)
      lambda do |hash|
        EXPLANATORY_KEYS.each { |key| hash.delete(key) }
        hash.delete('SafeAutoCorrect') if cop.include?('Rails/')
        hash.delete('EnforcedStyle') if cop.include?('Rails/PluckInWhere')
        hash['Enabled'] = true if hash['Enabled'] == 'pending'
        hash.sort.to_h
      end
    end

    def overwrite_config!
      File.write(CURRENT_CONFIG_PATH, new_config.to_yaml(indentation: 4, header: false))
    end

    def new_config
      new_config = {
        'require' => current_config.delete('require'),
        'inherit_mode' => current_config.delete('inherit_mode')
      }.merge!(current_config.uniq.sort.to_h)
      UNRECOGNIZED_COPS.each { |cop| new_config.delete(cop) }
      new_config
    end

    def current_config
      @current_config ||= YAML.load_file(CURRENT_CONFIG_PATH)
    end

    def latest_config
      @latest_config ||= GEMS.map(&fetch).reduce(:merge!)
    end

    def fetch
      ->(gem_name) { Enabler::Fetcher.new(gem_name).fetch }
    end
  end
end
