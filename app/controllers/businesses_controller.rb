class BusinessesController < ApplicationController
    get '/businesses' do
        @businesses = Business.all
        if logged_in?
            erb :'businesses/show'
        else
            redirect '/login'
        end
    end
end