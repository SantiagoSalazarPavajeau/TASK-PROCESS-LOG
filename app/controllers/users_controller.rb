require './config/environment'

class UsersController <  ApplicationController

    get '/users/home' do
        @user = User.find(session[:user_id])
        erb :'/users/home'
    end
      
    get '/users/failure' do
      erb :'/users/failure'
    end
    
    get "/registrations/signup" do
      # get request for signup form
      erb :'/registrations/signup'
    end
  
    post "/registrations" do
      #  post request to get the users info
      @user = User.new(name: params[:name], job: params[:job], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/users/home'
    end

end