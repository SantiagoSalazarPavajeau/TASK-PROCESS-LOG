class User < ActiveRecord::Base
    # A worker has many tasks
    has_secure_password
end
