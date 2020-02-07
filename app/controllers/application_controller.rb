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

  get '/tasks_by_job' do
    @jobs = Job.all
    erb :'/tasks/index_by_job'
  end

  get '/tasks_by_global_processes' do
    @global_processes = GlobalProcess.all
    erb :'/tasks/index_by_global_processes'
  end

  

end
