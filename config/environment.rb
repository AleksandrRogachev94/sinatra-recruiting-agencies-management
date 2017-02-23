require 'bundler/setup'
Bundler.require(:default)

# DATABASE_URL is for heroku.
# environment = ENV['RACK_ENV'] || "development"
# dbconfig = ENV['DATABASE_URL'] || YAML.load(ERB.new(File.read('config/database.yml')).result)[environment]

# configure :production do
#  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
#
#  ActiveRecord::Base.establish_connection(
#    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#    :host     => db.host,
#    :username => db.user,
#    :password => db.password,
#    :database => db.path[1..-1],
#    :encoding => 'utf8'
#  )
# end

ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || :development)

require 'rack-flash'
require_all 'app'
