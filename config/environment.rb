# ENV['SINATRA_ENV'] ||= "development"

# require 'bundler/setup'
# Bundler.require(:default, :development, :production)

# # ActiveRecord::Base.establish_connection(
# #   :adapter => "sqlite3",
# #   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# # )

# # require 'bundler/setup'
# # Bundler.require
# # configure :development do
# #  ENV['SINATRA_ENV'] ||= "development"
# # require 'bundler/setup'
# #  Bundler.require(:default, ENV['SINATRA_ENV'])
# # ActiveRecord::Base.establish_connection(
# #   :adapter => "sqlite3",
# #   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# #  )
# # end

# # configure :production do
# #  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

# #  ActiveRecord::Base.establish_connection(
# #    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
# #    :host     => db.host,
# #    :username => db.user,
# #    :password => db.password,
# #    :database => db.path[1..-1],
# #    :encoding => 'utf8'
# #  )
# # end

# require './app/controllers/application_controller'
# require './app/controllers/users_controller'
# require './app/controllers/jobs_controller'
# require './app/controllers/global_processes_controller'
# require './app/controllers/tasks_controller'


# require_all 'app'

require 'bundler'
Bundler.require(:default, :development, :production)
ENV['SINATRA_ENV'] ||= "development"

configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end


configure :production do
  db =  URI.parse(ENV['DATABASE_URL'] || 'postgres_database_url')
#  db =  'postgres://localhost/topofthemorning_development'

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'UTF8'

  )
end

require_relative '../app/controllers/application_controller.rb'
require_all 'app'
set :public_folder, File.dirname(__FILE__) + '/public'