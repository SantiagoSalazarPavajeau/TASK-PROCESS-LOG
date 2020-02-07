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
    @global_processes = GlobalProcess.all
    erb :'/global_processes/index'
  end

  get '/global_processes/new' do
        @tasks = Task.all
        erb :'/global_processes/new'
  end

  post '/global_processes' do
    @global_process = GlobalProcess.create(params[:global_process])

    if !params["task"]["description"].empty?
        @global_process.tasks << Task.create(description: params["task"]["description"])
    end
    redirect to "/global_processes/#{@global_process.id}"
  end

end
