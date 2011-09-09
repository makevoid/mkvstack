
class String
  def singular; singularize; end
end


APP_NAME = Rails.application.class.name.split("::")[0].downcase
DEVELOPER_NAME = "Francesco Canessa"
#DataMapper.setup(:default, "mysql://#{"root:PASSWORD@" if Rails.env == "production"}localhost/#{APP_NAME}_#{Rails.env}")

require "haml"
require "haml/template"
Haml::Template.options[:escape_html] = false
Haml::Template.options[:ugly] = false



# generators

# model
# script/generate model MODEL --skip-migration --no-test-framework