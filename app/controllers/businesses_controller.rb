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
            @business = current_user.businesses.create(name: params[:name], email: params[:email])
            if @business.save
                redirect "/businesses/#{@business.id}"
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

    get '/businesses/:id/edit' do
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

    patch '/businesses/:id' do
        if logged_in?
            @business = Business.find_by_id(params[:id])
            if current_user.businesses.include?(@business)
                @business.update(name: params[:name], email: params[:email])
                if @business.save
                    redirect "/businesses/#{@business.id}"
                else
                    redirect "/businesses/#{@business.id}/edit"
                end
            else
                redirect '/businesses'
            end
        else
            redirect '/login'
        end
    end

    delete '/bussiness/:id/delete' do
        if logged_in?
            @business = Business.find_by_id(params[:id])
            if current_user.businesses.include?(@business)
                @business.delete
                redirect '/businesses'
            else
                redirect "/businesses/#{@business.id}"
            end
        else
            redirect '/login'
        end
    end

end