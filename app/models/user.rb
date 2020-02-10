class User < ActiveRecord::Base
    has_secure_password
    has_many :jobs
    has_many :global_processes
    has_many :tasks
end
