require './config/environment'

class SessionsController <  ApplicationController

    
    
    post '/sessions' do
        @user = User.find_by(email: params["email"])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/users/home'
        else
          redirect '/users/failure'
        end
    end
    
    get '/sessions/logout' do
        session.clear
        redirect '/'
    end

end