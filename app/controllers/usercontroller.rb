class UserController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect to "/lists/showlist"
        else

        erb :'user/newuser'
        end
    end
  
    post '/signup' do
        
        @user = User.create(username: params[:user][:username], password_digest: params[:user][:username])
            session[:user_id] = @user.id
        redirect to '/lists/showlist'
    end
    get '/login' do
        if !logged_in?
            erb :"/user/login"
          else
            redirect to "/lists/showlist"
        end
    end
    post '/login' do    
        @user = User.find_by(:username =>[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
             redirect to "/lists/showlist"
             else
            redirect to '/login'
        end
    end
 end