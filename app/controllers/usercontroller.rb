class UserController < ApplicationController

    get '/newuser' do

        erb :'user/newuser'
    end
    post '/users' do
        @user = User.create(params[:user])
        binding.pry
        redirect to '/lists/showlist'
    end
    get '/login' do

        erb :'user/login'
        end
 end