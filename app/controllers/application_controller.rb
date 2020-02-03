require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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
    @user = Worker.create(name: params[:name], job: params[:job], email: params[:email], password: params[:password])
  end

end
