require 'active_record'
require 'active_support/all'
require './app/lib/booked_tee_times_importer'
require './app/lib/golfer_importer'
require './app/models/user'
require './app/models/booking'
# Add new app/ and lib/ files here when they are created.

module AppConfig

  DATABASE = ENV['DATABASE'] || 'development'

  DATABASE_PATH = File.absolute_path("db/#{DATABASE}.sqlite3", File.dirname(__FILE__))

  def self.establish_connection
    puts "Connecting to database '#{DATABASE_PATH}'"
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: DATABASE_PATH
    )
  end

end
