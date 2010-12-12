path = File.expand_path "../", __FILE__
require 'sinatra'

require "#{path}/config/env"

get "/" do
  "hello world!"
end