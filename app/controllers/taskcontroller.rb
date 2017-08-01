class TaskController < ApplicationController

    get '/tasks' do
        @tasks = current_user.tasks
        erb :'/tasks/taskindex'
    
    end


end