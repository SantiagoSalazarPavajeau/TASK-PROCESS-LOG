class Task < ActiveRecord::Base
    # A task belongs to a process
    # A task belongs to a worker
    belongs_to :job
    belongs_to :process

end
