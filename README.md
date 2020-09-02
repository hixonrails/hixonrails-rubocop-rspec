# rubocop-hixonrails

[![Gem Version][gem-version-img]][gem-version]
[![Build Status][build-status-img]][build-status]

RuboCop rules for [Hix on Rails][hixonrails] projects that use RSpec. Includes:

- [`rubocop`][rubocop]
- [`rubocop-performance`][rubocop-performance]
- [`rubocop-rails`][rubocop-rails]
- [`rubocop-rake`][rubocop-rake]
- [`rubocop-rspec`][rubocop-rspec]

Easily extensible, created by [Hix on Rails][hixonrails].

## Installation

Add this line to your application's Gemfile:

```ruby
group :test, :development do
  gem 'rubocop-hixonrails'
end
```

Do notice, that you do not need to include other `rubocop-*` gems in your
Gemfile, this single one will suffice.

For a Ruby library, add this to your gemspec:

```ruby
spec.add_development_dependency 'rubocop-hixonrails'
```

And then run:

```bash
$ bundle install
```

## Usage

Create a `.rubocop.yml` with the following directives:

```yaml
inherit_gem:
  rubocop-hixonrails:
    - default.yml
```

Now, run:

```bash
$ bundle exec rubocop
```

## Configuration

All configuration goes to [default.yml][config] file.

- [`rubocop` defaults][rubocop-defaults] & [Ruby styleguide][ruby-styleguide]
- [`rubocop-rspec` defaults][rubocop-rspec-defaults] & [RSpec styleguide][rspec-styleguide]
- [`rubocop-performance` defaults][rubocop-performance-defaults]

## Enable pending cops

The gem comes with an executable:

```bash
enable_pending_cops
```

To enable pending cops in the repository, simply run:

```bash
ruby bin/enable_pending_cops
```

This will:

1. Override all cops marked as `Enabled: pending` in the latest core or extensions' versions installed.
2. Automatically generate the _.rubocop_todo.yml_ file, without generating `Max: n` directives.

This way you can safely update the code, one by one.

## Publish to Rubygems

In order to publish new version of the gem follow the steps:

1. `git hf release start X.Y.Z`
2. bump up version in [`RubocopHixonrails::VERSION`][gem-version-path]
3. `git commit -am 'UPD version to X.Y.Z'`
4. `git hf release finish X.Y.Z`
5. `bundle update rubocop-hixonrails` in projects that use it

The `gem push` script is set up on CircleCI upon `git hf release finish`, as per
[Publishing RubyGems using Circle CI 2.0 article][publishing-rubygems-using-circleci].

[hixonrails]: https://hixonrails.com
[rubocop]: https://github.com/rubocop-hq/rubocop
[rubocop-performance]: https://github.com/rubocop-hq/rubocop-performance
[rubocop-rails]: https://github.com/rubocop-hq/rubocop-rails
[rubocop-rake]: https://github.com/rubocop-hq/rubocop-rake
[rubocop-rspec]: https://github.com/rubocop-hq/rubocop-rspec
[publishing-rubygems-using-circleci]: https://medium.com/@pezholio/publishing-rubygems-using-circle-ci-2-0-1dbf06ae9942
[gem-version-path]: https://github.com/hixonrails/rubocop-hixonrails/blob/master/lib/rubocop_hixonrails.rb#L4
[config]: https://github.com/hixonrails/rubocop-hixonrails/blob/master/default.yml
[rubocop-defaults]: https://github.com/rubocop-hq/rubocop/blob/master/config/default.yml
[ruby-styleguide]: https://rubystyle.guide/
[rubocop-rspec-defaults]: https://github.com/rubocop-hq/rubocop-rspec/blob/master/config/default.yml
[rspec-styleguide]: https://rspec.rubystyle.guide/
[rubocop-performance-defaults]: https://github.com/rubocop-hq/rubocop-performance/blob/master/config/default.yml
[gem-version]: https://rubygems.org/gems/rubocop-hixonrails
[build-status]: https://circleci.com/gh/hixonrails/rubocop-hixonrails/tree/master
[gem-version-img]: https://badge.fury.io/rb/rubocop-hixonrails.svg
[build-status-img]: https://circleci.com/gh/hixonrails/rubocop-hixonrails/tree/master.svg?style=shield
