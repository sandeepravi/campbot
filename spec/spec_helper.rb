require File.expand_path("../lib/campbot", File.dirname(__FILE__))
require 'webmock/rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

WebMock.disable_net_connect!(:allow_localhost => true)
