class Task < ActiveRecord::Base
    # A task belongs to a process
    # A task belongs to a worker
    belongs_to :job
    belongs_to :global_process
    belongs_to :user

end
