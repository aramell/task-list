class UserController < ApplicationController

    get '/signup' do
        if logged_in?(session)

            redirect to "/lists"
        else

        erb :'user/signup'
        end
    end
  
    post '/signup' do

        @user = User.new(username: params[:user][:username], password: params[:user][:password])
            @user.save
            session[:id] = @user.id
     redirect to '/lists'
    end

    get '/login' do
        if !logged_in?(session)
            erb :"/user/login"
          else
            redirect to "/lists"
        end
    end

    post '/login' do    
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:id] = user.id
             redirect to "/lists"
             else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        erb :'/homepage'
        end
 end