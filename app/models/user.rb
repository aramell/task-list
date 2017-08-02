class User < ActiveRecord::Base
    has_many :lists
    has_many :usertasks
    has_many :tasks, through: :usertasks
    has_secure_password 
    
    validates :username, presence: true, uniqueness: true


    
    
end