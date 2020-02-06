require './config/environment'


class JobsController < ApplicationController

    get '/jobs' do 
        # index displays all jobs
        @jobs = Job.all
        erb :'/jobs/index'
    end

    get '/jobs/new' do
        #create new job form
        @tasks = Task.all
        erb :'/jobs/new'
    end

    post '/jobs' do
        #create one new job (button action)
        @job = Job.create(params[:job])
        #@job.tasks << Task.create(description: params["task"]["description"])
        if !params["task"]["description"].empty?
            @job.tasks << Task.create(description: params["task"]["description"])
        end
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
        @tasks = Task.all
        erb :'jobs/edit'
    end

    patch '/jobs/:id' do
        #modifies job with :id
        if !params[:job].keys.include?("task_ids")
            params[:job]["task_ids"] = []
        end
        @job = Job.find(params[:id])
        @job.update(params[:job])
        if !params["task"]["description"].empty?
            @job.tasks << Task.create(description: params["task"]["description"])
        end
        
        redirect to "/jobs/#{@job.id}"
    end

    put '/jobs/:id' do
        # replaces job
    end

    delete '/jobs/:id' do
        # deletes job with :id
        @job = Job.find(params[:id])
        @job.delete
        redirect to '/jobs'
    end

end