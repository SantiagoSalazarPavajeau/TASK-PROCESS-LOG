require './config/environment'


class JobsController < ApplicationController

    get '/jobs' do 
        # index displays all jobs
        @jobs = Job.all
        erb :'/jobs/index'
    end

    get '/jobs/new' do
        #create new job form
    end

    post '/jobs' do
        #create one new job (button action)
    end

    get '/jobs/:id' do
        # displays job with :id
    end

    get '/jobs/:id/edit' do
        # edit jobs form
    end

    patch '/jobs/:id' do
        #modifies job with :id
    end

    put '/jobs/:id' do
        # replaces job
    end

    delete '/jobs/:id' do
        # deletes job with :id
    end




end