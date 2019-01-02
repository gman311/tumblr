# Run this script with `bundle exec ruby seeds.rb`
require 'sqlite3'
require 'active_record'

#require model classes
# require './models/cake.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

# do stuff to store initial data

if ENV['DATABASE_URL']
  require 'pg'
  # use DATABASE_URL since this is Heroku
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  # Use sqlite since this is my computer
  require 'sqlite3'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/development.db'
  )
end

register Sinatra::Reloader
enable :sessions

get '/' do
  erb :index
end