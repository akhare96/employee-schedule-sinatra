class BusinessesController < ApplicationController
    get '/businesses' do
        @businesses = Business.all
        if logged_in?
            erb :'businesses/show'
        else
            redirect '/login'
        end
    end

    get '/businesses/new' do
        if logged_in?
            erb :'businesses/new'
        else
            redirect 'login'
        end
    end

    post '/businesses' do
        if logged_in?
            @business = Business.create(name: params[:name], email[:email])
            if @business.save
                current_user << @business
                current_user.save
                redirect '/businesses/:id'
            else
                redirect '/businesses/new'
            end
        else
            redirect '/login'
        end
    end

    
end