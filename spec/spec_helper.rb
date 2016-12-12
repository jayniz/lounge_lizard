
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start { add_filter 'spec/' }

require 'lounge_lizard'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = :random
end
