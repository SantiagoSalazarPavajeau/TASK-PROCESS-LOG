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
        @global_process = GlobalProcess.create(params[:global_process])
        @global_process.tasks.build(params["task"])
        current_user.global_processes << @global_process
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
      #if logged_in? && current_user == @global_process.user
      redirect_if_not_logged_in?
      @tasks = @global_process.tasks.all
      erb :'global_processes/edit'
      #else
       # redirect to "/global_processes/#{@global_process.id}"
    end
    
    def redirect_if_not_logged_in?
      #logged_in?
      #redirect
      if !logged_in?
        redirect to "/login"
      end

    end
      
    
    patch '/global_processes/:id' do
      @global_process = GlobalProcess.find(params[:id])
      if logged_in? && current_user == @global_process.user

        # if there is no task_ids key create one which is an empty array 
        if !params[:global_process].keys.include?("task_ids")
            params[:global_process]["task_ids"] = []
        end

        #Explore with binding.pry... 
        @global_process.update(params[:global_process])

        #if description is not empty then build a task
        if !params["task"]["description"].empty?
          @task = Task.create(params[:task])
          @global_process.tasks << @task
          # @global_process.tasks.build(params["task"])
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