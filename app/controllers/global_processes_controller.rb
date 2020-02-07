require './config/environment'

class GlobalProcessesController <  ApplicationController

    get '/global_processes' do 
        # index displays all jobs
        @global_processes = GlobalProcess.all
        erb :'/global_processes/index'
    end

    # get '/processes/new' do
    #     #create new job form
    #     @tasks = Task.all
    #     erb :'/global_processes/new'
    # end

end