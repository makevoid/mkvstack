path = File.expand_path "../", __FILE__
APP_PATH = path

require 'bundler/setup'
Bundler.require :default


class App < Sinatra::Base
  require "#{APP_PATH}/config/env"
  
  configure :development do # use thin start
    register Sinatra::Reloader
    also_reload ["models/*.rb"]
    set :public_folder, "public"
    set :static, true
  end
  
  require "#{APP_PATH}/config/env"
  include Voidtools::Sinatra::ViewHelpers

  require "#{APP_PATH}/config/sinatra_env"
  helpers Sinatra::ContentFor
  
  require "#{APP_PATH}/lib/view_helpers"
  helpers ViewHelpers

  def not_found(object=nil)
    halt 404, "404 - Page Not Found"
  end

  get "/" do
    haml :index
  end
  
end