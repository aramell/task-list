class ListController < ApplicationController


    get '/lists' do
        @lists = List.all
    erb :'lists/index'
    end

    get "/newlist" do
        @list = List.create
        
        erb :'lists/new_list'
        end

    get '/lists/:id' do
        if logged_in?

        end
    end
end