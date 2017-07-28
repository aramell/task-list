require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    
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
