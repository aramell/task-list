class ListController < ApplicationController


    get '/lists' do
        @lists = List.all
    erb :'lists/index'
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