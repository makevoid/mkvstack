# Rails3 Stack


require 'extlib'
#include FileUtils

# mkvstack install will be the new default command
arg = ARGV[0] || "."
path = File.expand_path File.dirname(arg)

cmds = []

MKVSTACK_PATH = File.expand_path File.dirname(__FILE__)

STACK_APP_NAME = File.basename File.expand_path(File.dirname(arg))
STACK_APP_NAME_UPCASE = STACK_APP_NAME.capitalize

cmds << "rm -f #{path}/public/index.html"
cmds << "rm -f #{path}/public/javascripts/application.js"
cmds << "rm -f #{path}/public/images/rails.png"
cmds << "rm -f #{path}/app/views/layouts/application.html.erb"

cmds << "cp #{MKVSTACK_PATH}/Gemfile #{path}/Gemfile"

files2copy = Dir.glob "#{MKVSTACK_PATH}/stack/**/**"
files2copy.map do |file|
  file.gsub!(/^#{MKVSTACK_PATH}\/stack\//, '')
  source = "#{MKVSTACK_PATH}/stack/#{file}"
  dest = "#{path}/#{file}"
  
  if File.directory?(source)
    cmds << "mkdir -p #{dest}" 
  else
    cmds << "cp #{source} #{dest}"
  end
end

cmds.map do |cmd|
  #puts cmd
  system cmd
end

# substitutions
files2sub = ["config/database.yml", "config/application.rb", "config/initializers/exception_notifier.rb", "config.ru"]
files2sub.map do |file|
  newfile = ""
  File.open("#{path}/#{file}").each_line do |line|
    newfile << line.gsub(/STACK_APP_NAME_UPCASE/, STACK_APP_NAME_UPCASE).gsub(/STACK_APP_NAME/, STACK_APP_NAME)
  end
  File.open("#{path}/#{file}", "w"){ |f| f.write(newfile) }
end

# generate devise (fresh) configs and views programmatically
# bundle exec rails generate devise:install
# bundle exec rails generate devise User
# bundle exec rails generate devise:views --template-engine=haml


def exec(cmd)
  puts cmd
  `#{cmd}`
end


puts "setting svn ignores:"

exec "rm -f log/*.log"
exec "svn propset svn:ignore \".bundle\" ."
exec "cd log; svn propset svn:ignore \"*.log\" . ; cd .."
exec "cd tmp/cache; svn propset svn:ignore \"*\" . ; cd ../.."
exec "mkdir -p tmp/sass-cache"
exec "svn add tmp/sass-cache"
exec "cd tmp/sass-cache; svn propset svn:ignore \"*\" . ; cd ../.."
exec "cd tmp/pids; svn propset svn:ignore \"*\" . ; cd ../.."
exec "cd tmp/sessions; svn propset svn:ignore \"*\" . ; cd ../.."
exec "cd tmp/sockets; svn propset svn:ignore \"*\" . ; cd ../.."