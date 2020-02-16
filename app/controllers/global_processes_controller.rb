require './config/environment'

class GlobalProcessesController <  ApplicationController

    get '/global_processes' do 
        @global_processes = GlobalProcess.all
        erb :'/global_processes/index'
    end
    
    get '/global_processes/new' do
      @tasks = Task.all
      if logged_in?
        erb :'/global_processes/new'
      else
        redirect to "/global_processes"
      end

    end
    
    post '/global_processes' do
      #dont send to error page if both form fields have text in them
      if params[:global_process][:name] != "" && params["task"]["description"] != "" 
        #dont send to error page if boxes are checked or task has text
        # if !params[:global_processes][:task_ids].empty? || params["task"]["description"] != ""
          @global_process = GlobalProcess.create(params[:global_process])
        # if !params["task"]["description"].empty?
          @global_process.tasks << Task.create(description: params["task"]["description"])
          current_user.global_processes << @global_process
        # end
        redirect to "/global_processes/#{@global_process.id}" 
      else
          erb :failure
        
      end
    end
    
      get '/global_processes/:id' do
        @global_process = GlobalProcess.find(params[:id])
        erb :'global_processes/show'
      end
    
    get '/global_processes/:id/edit' do
      @global_process = GlobalProcess.find(params[:id])
      if logged_in? && current_user == @global_process.user
        @tasks = Task.all
        erb :'global_processes/edit'
      else
        redirect to "/global_processes/#{@global_process.id}"
      end
    end
    
      
    
    patch '/global_processes/:id' do
      @global_process = GlobalProcess.find(params[:id])
      if logged_in? && current_user == @global_process.user
        
        if !params[:global_process].keys.include?("task_ids")
            params[:global_process]["task_ids"] = []
        end

        #Explore with binding.pry... 
        @global_process.update(params[:global_process])

        if !params["task"]["description"].empty?
          @global_process.tasks.build(params["task"])
        end
        
        

        erb :'global_processes/show'
      else
        redirect to "/global_processes/#{@global_process.id}"
      end
    end
    
      delete '/global_processes/:id' do
        @global_process = GlobalProcess.find(params[:id])
        @global_process.delete
        redirect to '/global_processes'
      end

    

end