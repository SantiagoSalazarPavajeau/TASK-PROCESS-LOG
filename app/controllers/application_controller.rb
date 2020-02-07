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

  get '/global_processes' do 
    # index displays all jobs
    @global_processes = GlobalProcess.all
    erb :'/global_processes/index'
  end

end
