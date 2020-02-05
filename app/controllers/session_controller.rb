require './config/environment'

class SessionController < ApplicationController

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
    
      get '/sessions/logout' do
        session.clear
        redirect '/home'
      end


end