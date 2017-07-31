class TaskController < ApplicationController

    get '/tasks' do
        @tasks = Task.all
        erb :'/lists/index'
    end

        get '/newtask' do
            @task = Task.create
            @lists = List.all

            erb :'/tasks/new_task'
        end

        post '/task' do
            if logged_in? && params[:task][:title] != "" 
                @task = current_user.tasks.create(:title => params[:task][:title])
                else 
                redirect to '/newtask'
             end
                if params[:list][:name] != ""
                @list = current_user.lists.create(:name => params[:list][:name])
                else
                redirect to '/newtask'
                end
            redirect to "/"
        end
end