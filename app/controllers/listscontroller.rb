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
        if logged_in?(session)
        
        erb :'lists/new_list'
        else
        redirect to '/login'
        end
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

    get '/lists/:id/edit' do
        if logged_in?(session)
            @user_list = current_user.lists
            @list = @user_list.find_by(params)
        
        erb :'/lists/edit'
        else
        redirec to '/login'
        end
    end

    patch '/lists/:id' do
        @list = current_user.lists.find_by(params[:id])
        @list.update(name: params[:name])
        redirect to "/lists/#{@list.id}"
    end

    delete '/lists/:id/delete' do
            @list = current_user.lists.find_by_id(params[:id])
            
            @list.delete
        redirect to '/'
    end
end