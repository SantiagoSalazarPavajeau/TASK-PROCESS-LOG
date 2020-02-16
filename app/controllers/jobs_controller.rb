require './config/environment'


class JobsController < ApplicationController

    get '/jobs' do 
        # index displays all jobs
        @jobs = Job.all
        erb :'/jobs/index'
    end

    get '/jobs/new' do
        #create new job form
        @tasks = current_user.tasks.all
        if logged_in?
            erb :'/jobs/new'
        else
            redirect to "/jobs"
        end
    end

    post '/jobs' do
        #create one new job (button action)
        @job = Job.create(params[:job])
        #@job.tasks << Task.create(description: params["task"]["description"])
        @job.tasks.build(params["task"])
        current_user.jobs << @job
        redirect to "/jobs/#{@job.id}"
    end

    get '/jobs/:id' do
        # displays job with :id
        @job = Job.find(params[:id])
        erb :'jobs/show'
    end

    get '/jobs/:id/edit' do
        # edit jobs form
        @job = Job.find(params[:id])

        if logged_in? && current_user == @job.user
            @tasks = Task.all
            erb :"jobs/edit"
        else
            redirect to "/jobs/#{@job.id}"
        end
    end

    patch '/jobs/:id' do #modifies job with :id
        @job = Job.find(params[:id])
        if logged_in? && current_user == @job.user
            if !params[:job].keys.include?("task_ids")
                params[:job]["task_ids"] = []
            end
            @job.update(params[:job])
            if !params["task"]["description"].empty?
                @job.tasks.build(params["task"])
            end
            
            erb :"/jobs/show"
        else
            redirect to "/jobs/#{@job.id}"
        end
    end

    delete '/jobs/:id' do
        # deletes job with :id
        @job = Job.find(params[:id])
        @job.delete
        redirect to '/jobs'
    end

end