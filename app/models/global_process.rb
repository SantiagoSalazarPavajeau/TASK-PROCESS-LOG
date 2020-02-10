class GlobalProcess < ActiveRecord::Base
    # A Process has many Tasks
    has_many :tasks
    has_many :jobs, :through => :tasks
    belongs_to :user
end
