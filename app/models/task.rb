class Task < ActiveRecord::Base
belongs_to :list
has_many :usertasks
has_many :users, through: :usertasks

end