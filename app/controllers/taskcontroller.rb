class TaskController < ApplicationController

    get '/tasks' do
        @tasks = current_user.tasks
        erb :'/tasks/taskindex'
    
    end

    get '/newtask' do
        if logged_in?
        
            erb :'/lists/new_list'
        end
    end
    post '/tasks' do

            @task = current_user.tasks.create(:name => params[:task])

    end


end