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
        if logged_in?(session) && params[:name] != ""
           @task = current_user.tasks.create(:name => params[:name], :list_id => params[:list_id])
                redirect to '/tasks'

            else
            redirect to '/login'
            end
        end
        get '/tasks/:id' do
            @task = current_user.tasks.find_by_id(params[:id])

            erb :'/tasks/show'
        end 
        delete '/tasks/:id/delete' do
            @task = current_user.tasks.find_by_id(params[:id])
            @task.delete
        redirect to '/tasks'
    end


end