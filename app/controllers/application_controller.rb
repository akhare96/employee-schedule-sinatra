require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sinatra_phase2_project"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def permission_denied
      halt 401, "You are not authorized to see this page!" unless current_user.businesses.include?(@business) || current_user.employees.include?(@employee)
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end
  
  end
end
