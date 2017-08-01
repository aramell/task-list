require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
     @lists = List.all
     @users = User.all
    
    erb :homepage

  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(session[params])
    end
    
    
    
  end

end
