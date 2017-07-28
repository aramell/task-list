class TaskController < ApplicationController

    get '/tasks' do
        @tasks = Task.all
        erb :'/tasks'
    end

        get '/newtask' do
            @task = Task.create
            @lists = List.all

            erb :'/tasks/new_task'
        end

        post '/task' do
            if params[:task][:title] != ""
                @task = Task.create(:title => params[:task][:title])
                else 
                redirect to '/newtask'
             end
                if params[:list][:name] != "" || 
                @list = List.create(:name => params[:list][:name])
                else
                redirect to '/newtask'
                end
            redirect to "/"
        end
end