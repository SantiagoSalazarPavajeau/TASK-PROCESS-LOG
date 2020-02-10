require './config/environment'

class UsersController <  ApplicationController

    get '/users/home' do
        @user = User.find(session[:user_id])
        erb :'/users/home'
    end
      
    get '/users/failure' do
      erb :'/users/failure'
    end
    
    get "/users/signup" do
      # get request for signup form
      erb :'/users/signup'
    end
  
    post "/users" do
      #  post request to get the users info
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/users/home'
    end

end