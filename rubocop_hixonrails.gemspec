# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop_hixonrails'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-hixonrails'
  spec.version       = RubocopHixonrails::VERSION
  spec.authors       = ['Hix on Rails', 'Wiktor Plaga']
  spec.license       = 'MIT'
  spec.email         = ['hello@hixonrails.com']
  spec.date          = '2020-09-02'
  spec.summary       = 'Hix on Rails Styleguide'
  spec.homepage      = 'https://github.com/hixonrails/rubocop-hixonrails'
  spec.files         = ['lib/rubocop_hixonrails.rb', 'bin/enable_pending_cops', 'default.yml', '.rubocop.yml']
  spec.require_paths = %w[lib bin]
  spec.bindir        = 'bin'
  spec.executables   = %w[enable_pending_cops]
  spec.description   = <<-DESCRIPTION
    RuboCop configuration with the following extensions:
    - rubocop-rails,
    - rubocop-performance,
    - rubocop-rspec
    - rubocop-rake.
    Easily extensible, created by Hix on Rails.
  DESCRIPTION
  spec.add_dependency('rubocop', '~> 1.6.1')
  spec.add_dependency('rubocop-performance', '~> 1.9.1')
  spec.add_dependency('rubocop-rails', '~> 2.9.0')
  spec.add_dependency('rubocop-rake', '~> 0.5.1')
  spec.add_dependency('rubocop-rspec', '~> 2.0.1')
  spec.required_ruby_version = '>= 2.6.5'
end
