require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
     @lists = List.all
     @users = User.all
    
    erb :homepage

  end

  helpers do
    def logged_in?(session)
      !!session[:id] ? true : false
    end

    def current_user
    @user =  User.find(session[:id])
    end
    
    
    
  end

end
