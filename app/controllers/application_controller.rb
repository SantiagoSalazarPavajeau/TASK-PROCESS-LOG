require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/home' do
    erb :home
  end

  get "/registrations/signup" do
    # get request for signup form
    erb :'/registrations/signup'
  end

  post "/registrations" do
    #  post request to get the users info
    @worker = Worker.new(name: params[:name], job: params[:job], email: params[:email], password: params[:password])
    @worker.save
    session[:user_id] = @worker.id
    redirect '/users/home'
  end

 

  get '/users/home' do
    @worker = Worker.find(session[:user_id])
    erb :'/users/home'
  end
  
  get '/sessions/login' do
    erb :'/sessions/login'
  end

  post '/sessions' do
    @worker = Worker.find_by(email: params["email"])
    if @worker && @worker.authenticate(params[:password])
      session[:user_id] = @worker.id
      redirect '/users/home'
    else
      redirect '/users/failure'
    end
  end

  get '/users/failure' do
    erb :'/users/failure'
  end

  get '/sessions/logout' do
    session.clear
    redirect '/home'
  end



end
