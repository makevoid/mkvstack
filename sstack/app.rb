path = File.expand_path "../", __FILE__
require 'sinatra'

require "#{path}/config/env"


get "/" do
  haml :index
end

get '/css/main.css' do
  sass :main
end