
namespace :db do

  desc "seed"
  task :seeds => :environment do
    DataMapper.auto_migrate!
    require File.expand_path('../../../db/seeds', __FILE__)
  end

end