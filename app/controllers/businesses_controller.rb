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
            @business = Business.create(name: params[:name], email: params[:email])
            if @business.save
                current_user << @business
                current_user.save
                redirect "/businesses/:#{@business.id}"
            else
                redirect '/businesses/new'
            end
        else
            redirect '/login'
        end
    end

    get '/businesses/:id' do
        if logged_in?
            @business = Business.find_by_id(params[:id])
            erb :'businesses/show_business'
        else
            redirect '/login'
        end
    end

    get 'businesses/:id/edit' do
        if logged_in?
            @business = Business.find_by_id(params[:id])
            if current_user.businesses.include?(@business)
                erb :'businesses/edit'
            else
                redirect '/businesses'
            end
        else
            redirect '/login'
        end
    end
    
end