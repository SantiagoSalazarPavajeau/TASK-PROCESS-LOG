require './config/environment'

class UsersController <  ApplicationController

    get '/users/home' do
        @user = User.find(session[:user_id])
        erb :'/users/home'
    end
      
    get '/failure' do
      erb :'/failure'
    end
    
    get "/signup" do
      # get request for signup form
      erb :'/signup'
    end

    post "/signup" do
      #  post request to get the users info
      if params[:name] != "" && params[:email] != "" && params[:password] != ""
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        redirect '/users/home'
      else
        erb :"/users/failure"
      end
    end

    get '/login' do
      erb :'/login'
    end

    post '/login' do
      @user = User.find_by(email: params["email"])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/users/home'
      else
        redirect '/users/failure'
      end
  end
  
    

end