require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/tasks' do
    @jobs = Job.all
    @global_processes = GlobalProcess.all
    erb :'/tasks/index'
  end

  

end
