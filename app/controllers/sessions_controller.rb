require './config/environment'

class SessionController < Sinatra::Base


get '/sessions/login' do
    erb :'/sessions/login'
  end

  post '/sessions' do
    @worker = Worker.find_by(email: params["email"], password: params["password"])
    session[:user_id] = @worker.id
    redirect '/users/home'
  end

  get '/sessions/logout' do
    session.clear
    redirect '/home'
  end

end