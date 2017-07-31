class User < ActiveRecord::Base
    has_many :lists
    has_many :usertasks
    has_many :tasks, through: :usertasks

    # validates :username, :presence => true
    
    
end