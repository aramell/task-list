class ListController < ApplicationController


    get '/lists' do
        if logged_in?(session)
        @lists = current_user.lists
            erb :'lists/index'

        else
            redirect to '/login'
            end
    end

    get "/newlist" do
        
        erb :'lists/new_list'
        end
    post '/list' do
        if params[:name] == "" 
            redirect to "/newlist"
            else
        @list = current_user.lists.create(:name => params[:name])
        #    if params[:task] != ""
        # @list.tasks.create(:name => params[:task])
       end
        @list.save
        redirect to '/lists'
        
    end


    get '/lists/:id' do
        if logged_in?(session)
            @user_list = current_user.lists
            @list = @user_list.find_by(params)
        
        erb :'/lists/show'
        else
            redirect to '/login'

        end
    end
    post '/lists/:id/delete' do
            @list = List.find_by_id(params[:id])
            @list.delete
        redirect to '/'
        end
end