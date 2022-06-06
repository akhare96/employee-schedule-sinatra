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

end