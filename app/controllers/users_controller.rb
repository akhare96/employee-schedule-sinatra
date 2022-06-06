class UsersController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/businesses'
        else
            erb :'users/login'
        end
    end

end