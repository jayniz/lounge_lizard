$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler'
Bundler.require

require 'lounge_lizard'
require 'rubygems'

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start { add_filter 'spec/' }

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = :random
end
