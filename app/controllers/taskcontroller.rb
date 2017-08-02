class TaskController < ApplicationController

    get '/tasks' do
        @tasks = current_user.tasks
        erb :'/tasks/taskindex'
    
    end

    get '/newtask' do
        if logged_in?(session)
            @list = current_user.lists
            erb :'/tasks/newtask'
        else

            redirect to '/login'
        end
    end
    post '/tasks' do
        if logged_in?(session)
            binding.pry
           @task = current_user.tasks.create(:name => params[:task], :list_id => params[:list_id])
                redirect to '/tasks'

            else
            redirect to '/login'
            end
        end


end