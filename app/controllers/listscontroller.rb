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
        @list = List.create
        
        erb :'lists/show'
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
            @list.destroy
        redirect to '/'
        end
end