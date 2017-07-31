class Task < ActiveRecord::Base
has_many :usertasks
has_many :lists, through: :usertasks
    

end