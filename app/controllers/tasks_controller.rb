require './config/environment'

class TasksController < ApplicationController

    

    get "/tasks" do
        @jobs = Job.all
        @global_processes = GlobalProcess.all
        erb :"tasks/index"
    end
end

