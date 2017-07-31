class User < ActiveRecord::Base
    has_many :lists
    has_secure_password 

    # validates :username, :presence => true
    
    
end