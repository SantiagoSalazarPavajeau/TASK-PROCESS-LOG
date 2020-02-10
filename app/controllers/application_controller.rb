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
helpers do

  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

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
