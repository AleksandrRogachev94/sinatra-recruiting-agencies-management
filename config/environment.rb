require 'bundler/setup'
Bundler.require(:default)

environment = ENV['RACK_ENV'] || "development"
dbconfig = YAML.load(ERB.new(File.read('config/database.yml')).result)
#puts dbconfig.inspect
ActiveRecord::Base.establish_connection(dbconfig[environment])

require 'rack-flash'
require_all 'app'
