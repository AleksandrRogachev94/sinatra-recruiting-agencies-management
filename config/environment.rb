require 'bundler/setup'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/agencies_db.sqlite"
)

require 'rack-flash'
require_all 'app'
