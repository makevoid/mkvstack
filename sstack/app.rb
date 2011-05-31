require 'haml'
require 'sass'
require 'sinatra/base'
require 'sinatra/reloader'

path = File.expand_path "../", __FILE__
APP_PATH = path

class App < Sinatra::Base
  require "#{APP_PATH}/config/env"
  
  configure :development do # this way you can use thin, shotgun is so slow...
    register Sinatra::Reloader
    also_reload ["controllers/*.rb", "models/*.rb"]
    set :public, "public"
    set :static, true
  end
  
  set :haml, { :format => :html5 }
  require 'rack-flash'
  enable :sessions
  use Rack::Flash
  require 'sinatra/content_for'
  helpers Sinatra::ContentFor
  set :method_override, true
  
  require "#{APP_PATH}/lib/view_helpers"
  helpers ViewHelpers

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