require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/registrations/signup" do
    erb :'/registrations/signup'
  end

  # get request for signup form

  post "/registrations" do
    @user = User.create(name: params[:name], job: params[:job], email: params[:email], password: params[:password])
  end

end
