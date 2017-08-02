class TaskController < ApplicationController

    get '/tasks' do
        @tasks = current_user.tasks
        erb :'/tasks/taskindex'
    
    end

    get '/newtask' do
        if logged_in?
        
            erb :'/lists/new_list'
        else

            redirect to '/login'
            end
    end
    post '/tasks' do
        binding.pry
            @task = current_user.tasks.create(:name => params[:task])

    end


end