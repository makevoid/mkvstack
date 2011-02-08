require 'haml'
require 'sass'
require 'sinatra'
enable :sessions

path = File.expand_path "../", __FILE__
APP_PATH = path

class App < Sinatra::Base
  require "#{APP_PATH}/config/env"


  def not_found(object=nil)
    halt 404, "404 - Page Not Found"
  end

  get "/" do
    haml :index
  end

  get '/css/main.css' do
    sass :main
  end
  
end