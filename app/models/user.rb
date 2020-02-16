class User < ActiveRecord::Base
    has_secure_password
    has_many :jobs
    has_many :global_processes
    has_many :tasks

    validates :name , presence: true
    validates :email , presence: true
    validates :password , presence: true
    validates :password , length: {in: 7..20}
    



end
