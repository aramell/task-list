class ListController < ApplicationController


    get '/lists' do
        if logged_in?
        @lists = List.all
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
            
            redirect to '/lists'
        end
    end


    get '/lists/:id' do
        if logged_in?
            @list = List.find_by_id(params[:id])
        
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