require './config/environment'

class TasksController < ApplicationController

    get "/tasks/index_by_job" do
        @jobs = Job.all
        erb :"tasks/index_by_job"
    end

    get "/tasks/index_by_global_processes" do
        @global_processes = GlobalProcess.all
        erb :"tasks/index_by_global_processes"
    end
end

