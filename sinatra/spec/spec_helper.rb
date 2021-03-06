path = File.expand_path "../../", __FILE__
require "#{path}/config/env"

require 'webrat'
require 'rspec'
#require 'capybara/rspec'
require 'rack/test'


module MyHelpers
  def app
    App
  end
end

Webrat.configure do |config|
  config.mode = :rack
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include MyHelpers
  config.include Webrat::Methods
  config.include Webrat::Matchers
end
