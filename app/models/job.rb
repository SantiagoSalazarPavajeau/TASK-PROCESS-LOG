class Job < ActiveRecord::Base
    #tasks belong to a job
    #a job has many tasks
    #jobs have many processes through tasks
    #processes have many jobs through tasks
    has_many :tasks
    has_many :global_processes, :through => :tasks
end


