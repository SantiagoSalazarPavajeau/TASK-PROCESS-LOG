require './config/environment'

class GlobalProcessesController <  ApplicationController

    get '/global_processes' do 
        @global_processes = GlobalProcess.all
        erb :'/global_processes/index'
    end
    
      get '/global_processes/new' do
            @tasks = Task.all
            erb :'/global_processes/new'
      end
    
      post '/global_processes' do
        @global_process = GlobalProcess.create(params[:global_process])
        
        if !params["task"]["description"].empty?
            @global_process.tasks << Task.create(description: params["task"]["description"])
            current_user.global_processes << @global_process
        end
        redirect to "/global_processes/#{@global_process.id}"
      end
    
      get '/global_processes/:id' do
        @global_process = GlobalProcess.find(params[:id])
        erb :'global_processes/show'
      end
    
      get '/global_processes/:id/edit' do
        @global_process = GlobalProcess.find(params[:id])
        @tasks = Task.all
        erb :'global_processes/edit'
      end
    
      
    
      patch '/global_processes/:id' do
    
        if !params[:global_process].keys.include?("task_ids")
            params[:global_process]["task_ids"] = []
        end
    
        @global_process = Job.find(params[:id])
        @global_process.update(params[:global_process])

        if !params["task"]["description"].empty?
            @global_process.tasks << Task.create(description: params["task"]["description"])
        end
        erb :'global_processes/show'
        #redirect to "/global_processes/#{@global_process.id}"
      end
    
      delete '/global_processes/:id' do
        @global_process = GlobalProcess.find(params[:id])
        @global_process.delete
        redirect to '/global_processes'
      end

    

end