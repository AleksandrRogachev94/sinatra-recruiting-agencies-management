require 'bundler/setup'

if ENV["DATABASE_URL"]
  Bundler.require(:default)
else
  Bundler.require(:default, :development)
end

# environment = ENV['RACK_ENV'] || "development"
# dbconfig = ENV['DATABASE_URL'] || YAML.load(ERB.new(File.read('config/database.yml')).result)[environment]

# Setting environmental variables
# DATABASE_URL is for heroku.
# In order to locally use postgresql database you need to set the following env vars: PG_USER, PG_PASS (see database.yml).
# In order to use custom session_secret set env variable SESS_SECRET (see application_controller.rb).

# Establish connection with db
ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || :development)

require 'rack-flash'
require_all 'app'
