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
        if @user.valid?
          session[:user_id] = @user.id
          redirect '/users/home'
        else
          @user = User.new(params)
          @user.valid?
          erb :"/failure"
        end
      else
        @user = User.new(params)
        @user.valid?
        erb :"/failure"
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
        redirect '/failure'
      end
    end

    get '/logout' do
    session.clear
    redirect '/'
    end

    get '/users' do
      @users = User.all
      erb :'users/index'
    end

    get '/users/:id' do
      @user = User.find(params[:id])
      erb :'/users/show'
    end
     
  
    

end