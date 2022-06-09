class UsersController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/businesses'
        else
            erb :'users/login'
        end
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect '/businesses'
        else
            redirect '/login'
        end
    end

    get '/signup' do
        if logged_in?
            redirect '/businesses'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if @user.save
            session[:id] = @user.id
            redirect '/businesses'
        else
            redirect '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        end
    end

end